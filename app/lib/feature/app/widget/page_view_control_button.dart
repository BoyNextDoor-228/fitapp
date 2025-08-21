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
    this.caption,
    super.key,
  });

  final String? caption;
  final Icon icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    // onTap == null means button is disabled, so it's text color must match
    // disabled button color.
    final textStyle = onTap == null
        ? TextStyle(color: Theme.of(context).disabledColor)
        : null;

    return Column(
      children: [
        Flexible(
          child: IconButton(
            icon: icon,
            onPressed: onTap,
          ),
        ),
        if (caption != null)
          Flexible(
            child: Text(
              caption!,
              style: textStyle,
            ),
          ),
      ],
    );
  }
}
