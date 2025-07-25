import 'package:flutter/material.dart';

import '../../../settings/domain/settings_values.dart';
import 'flag_image.dart';

class LanguageFlag extends StatelessWidget {
  /// Creates a picture of a country flag and native caption below.
  ///
  /// [imagePath] is a path to country flag image asset.
  /// [language] is a corresponding language of country flag.
  /// [onSelected] is a callback, which will be called on widget tap.
  const LanguageFlag({
    required this.imagePath,
    required this.language,
    required this.onSelected,
    super.key,
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
