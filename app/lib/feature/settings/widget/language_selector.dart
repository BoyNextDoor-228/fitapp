import 'package:flutter/material.dart';

import '../../../tool/bottom_sheet_provider.dart';
import '../../../util/assets.dart';
import '../../app/widget/shared/language_flag.dart';
import '../domain/settings/settings.dart';
import '../domain/settings_values.dart';

class LanguageSelector extends StatelessWidget {
  /// Creates a selector, which allows to select a language.
  ///
  /// Represents a box with selected language flag image. By tap action opens
  /// [BottomSheet] menu with different language flags to select.
  ///
  /// [captionText] is a text, which is displayed on top of [BottomSheet].
  /// [onLanguageSelected] is a callback, which is called on selected language
  /// tap action.
  /// [initialLanguage] is a language, which will be shown as pre-selected.
  LanguageSelector({
    required this.captionText,
    required this.onLanguageSelected,
    required FitAppLanguages? initialLanguage,
    super.key,
  }) {
    if (initialLanguage == null) {
      _initialLanguage = Settings.recognizeLanguage();
    } else {
      _initialLanguage = initialLanguage;
    }
  }

  final String captionText;
  final Future<void> Function(FitAppLanguages language) onLanguageSelected;
  late final FitAppLanguages _initialLanguage;

  static const languageFlags = {
    FitAppLanguages.english: FitAppAssets.englishFlagImagePath,
    FitAppLanguages.russian: FitAppAssets.russianFlagImagePath,
  };

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(20),
        child: GestureDetector(
          onTap: () async => _openLanguageSelectionMenu(context),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(5)),
            child: Image.asset(languageFlags[_initialLanguage]!),
          ),
        ),
      );

  Future<void> _openLanguageSelectionMenu(BuildContext context) async {
    final screenHeight = MediaQuery.sizeOf(context).height;

    final languageFlagsWidgets = languageFlags.entries
        .map<Widget>(
          (entry) => LanguageFlag(
            imagePath: entry.value,
            language: entry.key,
            onSelected: () =>
                Navigator.pop<FitAppLanguages>(context, entry.key),
          ),
        )
        .toList();

    final language = await showBottomSheetWithResultOf<FitAppLanguages>(
      context: context,
      headerText: captionText,
      height: screenHeight * 0.5,
      content: GridView.count(
        crossAxisCount: 2,
        children: languageFlagsWidgets,
      ),
    );

    if (language != null) {
      await onLanguageSelected(language);
    }
  }
}
