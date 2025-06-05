import 'package:flutter/material.dart';

import '../../../tool/bottom_sheet_provider.dart';
import '../../../util/assets.dart';
import '../../app/widget/shared/language_flag.dart';
import '../domain/settings/settings.dart';
import '../domain/settings_values.dart';

class LanguageSelector extends StatelessWidget {
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

// class _LanguageFlag extends StatelessWidget {
//   const _LanguageFlag({
//     required this.imagePath,
//     required this.language,
//   });
//
//   final String imagePath;
//   final FitAppLanguages language;
//
//   @override
//   Widget build(BuildContext context) {
//     final borderColor = Theme.of(context).colorScheme.primary;
//
//     return Padding(
//       padding: const EdgeInsets.all(10),
//       child: GestureDetector(
//         onTap: () => Navigator.pop<FitAppLanguages>(context, language),
//         child: FlagImage(imagePath: imagePath, imageSize: 50),
//       ),
//     );
//   }
// }
