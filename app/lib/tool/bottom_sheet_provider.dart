import 'package:flutter/material.dart';

import '../feature/app/widget/fitapp_bottom_sheet.dart';

/// Opens Material modal [BottomSheet], which just shows a content.
///
/// [headerText] is a label, which will be displayed as description on top of
/// [BottomSheet].
/// [content] is the main content to be shown in [BottomSheet].
/// [height] is a height of [BottomSheet].
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

/// Opens Material modal [BottomSheet], which may return a [T] object.
///
/// [headerText] is a label, which will be displayed as description on top of
/// [BottomSheet].
/// [content] is the main content to be shown in [BottomSheet].
/// [height] is a height of [BottomSheet].
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
