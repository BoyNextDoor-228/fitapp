import 'dart:async';

import 'package:flutter/material.dart';

import '../../../generated/l10n.dart';

class CardMenuButtons extends StatelessWidget {
  const CardMenuButtons({
    required this.onDeletePressed,
    required this.onEditPressed,
    required this.deletionText,
    super.key,
  });

  final void Function() onDeletePressed;
  final Future<void> Function() onEditPressed;
  final String deletionText;

  @override
  Widget build(BuildContext context) {
    final text = S.of(context);

    return PopupMenuButton(
      itemBuilder: (_) => <PopupMenuEntry<FutureOr<void>>>[
        PopupMenuItem(
          onTap: () async {
            await onEditPressed();
          },
          child: Text(text.edit),
        ),
        PopupMenuItem(
          child: Text(text.delete),
          // TODO(BoyNextDoor-228): Implement as extension.
          onTap: () async {
            await showDialog(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                title: Text(text.deletion),
                content: Text(deletionText),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text(text.no),
                  ),
                  TextButton(
                    onPressed: () {
                      onDeletePressed();
                      Navigator.pop(context);
                    },
                    child: Text(text.yes),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
