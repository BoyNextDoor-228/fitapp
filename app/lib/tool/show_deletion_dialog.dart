import 'package:flutter/material.dart';

import '../generated/l10n.dart';

/// Shows dialog, which asks to confirm deletion.
///
/// [deleteWhat] is the subject of deletion.
/// [onConfirmed] is a callback, which is called, when confirmation button
/// tapped.
Future<void> showDeletionDialog({
  required BuildContext context,
  required String deleteWhat,
  required VoidCallback onConfirmed,
}) async {
  final text = S.of(context);

  await showDialog(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      title: Text(text.deletion),
      content: Text(text.areYouSureYouWantToDelete(deleteWhat)),
      actions: [
        TextButton(
          onPressed: () {
            onConfirmed();
            Navigator.pop(context);
          },
          child: Text(text.yes),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(text.no),
        ),
      ],
    ),
  );
}
