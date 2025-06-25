import 'package:flutter/material.dart';

class FitAppSnackBarContent extends StatelessWidget {
  const FitAppSnackBarContent({
    required this.snackBarText,
    required this.messageType,
    super.key,
  });

  final String snackBarText;
  final SnackBarMessageType messageType;

  static const double _horizontalSpacing = 20;

  @override
  Widget build(BuildContext context) => Row(
        spacing: _horizontalSpacing,
        children: [
          _SnackBarIcon(messageType: messageType),
          Expanded(
            child: Text(
              snackBarText,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      );
}

enum SnackBarMessageType { success, error, info }

class _SnackBarIcon extends StatelessWidget {
  const _SnackBarIcon({required this.messageType});

  final SnackBarMessageType messageType;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    final snackBarErrorTextColor = colorScheme.error;
    final snackBarSuccessTextColor = colorScheme.onPrimary;

    switch (messageType) {
      case SnackBarMessageType.error:
        return Icon(
          Icons.error,
          color: snackBarErrorTextColor,
        );
      case SnackBarMessageType.success:
        return Icon(
          Icons.done,
          color: snackBarSuccessTextColor,
        );
      case SnackBarMessageType.info:
        return Icon(
          Icons.info,
          color: snackBarSuccessTextColor,
        );
    }
  }
}
