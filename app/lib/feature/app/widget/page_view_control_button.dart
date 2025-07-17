import 'package:flutter/material.dart';

class PageViewControlButton extends StatelessWidget {
  /// Creates a button, which handles an action of a [PageView] (go to
  /// next/previous page).
  ///
  /// [icon] is an icon of button.
  /// [onTap] is an action, that will be performed on button tap action. If
  /// [Null], the button will be disabled.
  const PageViewControlButton({
    required this.icon,
    required this.onTap,
    super.key,
  });

  final Icon icon;
  final Future<void> Function()? onTap;

  @override
  Widget build(BuildContext context) => IconButton(
        icon: icon,
        onPressed: onTap,
      );
}
