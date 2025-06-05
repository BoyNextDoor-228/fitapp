import 'package:flutter/material.dart';

import '../../../../generated/l10n.dart';
import '../../../../tool/bottom_sheet_provider.dart';
import '../../../../util/assets.dart';
import '../../../app/widget/shared/flag_image.dart';
import '../../../settings/domain/settings_values.dart';

class LanguageSelectionSubpage extends StatelessWidget {
  const LanguageSelectionSubpage({
    required this.onLanguageSelected,
    super.key,
  });

  final Future<void> Function(FitAppLanguages language) onLanguageSelected;

  @override
  Widget build(BuildContext context) {
    final text = S.of(context);

    final textTheme = Theme.of(context).textTheme;
    final iconColor = Theme.of(context).colorScheme.tertiaryContainer;

    return Column(
      spacing: 10,
      children: [
        Expanded(
          flex: 3,
          child: Icon(
            Icons.language,
            size: 200,
            color: iconColor,
          ),
        ),
        Text(
          text.selectLanguage,
          style: textTheme.headlineMedium,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        _LanguageSelectionButton(onLanguageSelected: onLanguageSelected),
      ],
    );
  }
}

class _LanguageFlag extends StatelessWidget {
  const _LanguageFlag({
    required this.imagePath,
    required this.language,
    required this.onSelected,
  });

  final FitAppLanguages language;
  final String imagePath;

  final VoidCallback onSelected;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final width = MediaQuery.sizeOf(context).shortestSide;

    return InkWell(
      onTap: onSelected,
      child: Column(
        children: [
          FlagImage(
            imagePath: imagePath,
            imageSize: width * 0.3,
          ),
          Text(
            language.nativeCaption,
            style: textTheme.titleLarge,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}

class _LanguageSelectionButton extends StatelessWidget {
  const _LanguageSelectionButton({
    required this.onLanguageSelected,
  });

  final Future<void> Function(FitAppLanguages language) onLanguageSelected;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).longestSide;
    final textTheme = Theme.of(context).textTheme;

    return InkWell(
      onTap: () async => _openLanguageSelectionMenu(context),
      child: SizedBox(
        width: double.infinity,
        height: height * 0.1,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Expanded(
                  flex: 2,
                  child: Stack(
                    children: [
                      FlagImage(
                        imagePath: FitAppAssets.englishFlagImagePath,
                        imageSize: 50,
                      ),
                      Positioned(
                        left: 20,
                        child: FlagImage(
                          imagePath: FitAppAssets.russianFlagImagePath,
                          imageSize: 50,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Text(
                    'English/Русский/...',
                    style: textTheme.titleMedium,
                  ),
                ),
                const Expanded(
                  child: Icon(
                    Icons.arrow_drop_down_circle_outlined,
                    size: 30,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _openLanguageSelectionMenu(BuildContext context) async {
    final text = S.of(context);
    final height = MediaQuery.sizeOf(context).height;

    final selectedLanguage = await showBottomSheetWithResultOf<FitAppLanguages>(
      context: context,
      headerText: text.selectLanguage,
      height: height * 0.5,
      content: GridView.count(
        crossAxisCount: 2,
        children: [
          _LanguageFlag(
            imagePath: FitAppAssets.englishFlagImagePath,
            language: FitAppLanguages.english,
            onSelected: () => Navigator.pop<FitAppLanguages>(
              context,
              FitAppLanguages.english,
            ),
          ),
          _LanguageFlag(
            imagePath: FitAppAssets.russianFlagImagePath,
            language: FitAppLanguages.russian,
            onSelected: () => Navigator.pop<FitAppLanguages>(
              context,
              FitAppLanguages.russian,
            ),
          ),
        ],
      ),
    );

    if (selectedLanguage != null) {
      await onLanguageSelected(selectedLanguage);
    }
  }
}

// class _FlagImage extends StatelessWidget {
//   const _FlagImage({
//     required this.imagePath,
//     required this.imageSize,
//   });
//
//   final String imagePath;
//   final double imageSize;
//
//   @override
//   Widget build(BuildContext context) => ClipRRect(
//         borderRadius: const BorderRadius.all(Radius.circular(5)),
//         child: SizedBox(
//           width: imageSize,
//           child: Image.asset(imagePath),
//         ),
//       );
// }
