import 'package:flutter/material.dart';

class FlagImage extends StatelessWidget {
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
