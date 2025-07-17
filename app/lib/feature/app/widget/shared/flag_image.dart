import 'package:flutter/material.dart';

class FlagImage extends StatelessWidget {
  /// Creates a sized [Image].
  ///
  /// [imagePath] is a path to image asset.
  /// [imageSize] is a desired image's size.
  const FlagImage({
    required this.imagePath,
    required this.imageSize,
    super.key,
  });

  final String imagePath;
  final double imageSize;

  @override
  Widget build(BuildContext context) => ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(5)),
        child: SizedBox(
          width: imageSize,
          child: Image.asset(imagePath),
        ),
      );
}
