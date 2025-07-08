import 'package:flutter/material.dart';

class PageViewControlButton extends StatelessWidget {
  const PageViewControlButton({
    required this.icon,
    required this.onTap,
    required this.isActive,
    super.key,
  });

  final Icon icon;
  final Future<void> Function() onTap;
  final bool isActive;

  @override
  Widget build(BuildContext context) => IconButton(
        icon: icon,
        onPressed: isActive ? () async => onTap() : null,
      );
}
