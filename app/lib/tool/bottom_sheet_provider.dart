import 'package:flutter/material.dart';

import '../feature/app/widget/fitapp_bottom_sheet.dart';

Future<void> showVoidModalBottomSheet({
  required BuildContext context,
  required String headerText,
  required Widget content,
  double? height,
}) async {
  await showModalBottomSheet<void>(
    isScrollControlled: true,
    context: context,
    builder: (_) => FitAppBottomSheet(
      headerText: headerText,
      content: content,
      height: height,
    ),
  );
}

Future<T?> showBottomSheetWithResultOf<T>({
  required BuildContext context,
  required String headerText,
  required Widget content,
  double? height,
}) async =>
    showModalBottomSheet<T>(
      isScrollControlled: true,
      context: context,
      builder: (_) => FitAppBottomSheet(
        headerText: headerText,
        content: content,
        height: height,
      ),
    );
