import 'package:flutter/material.dart';

import '../generated/l10n.dart';

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
      content: Text(text.areYouSureYouWantToDeleteThisObject(deleteWhat)),
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
