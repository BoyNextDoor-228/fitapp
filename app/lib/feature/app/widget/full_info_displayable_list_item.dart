import 'package:flutter/material.dart';

import '../../../tool/bottom_sheet_provider.dart';

class FullInfoDisplayableListItem extends StatelessWidget {
  /// Displays a [listItem] in a list this widget was called from.
  ///
  /// On tap action opens a ModalBottomSheet, which contains full information
  /// about subject of this list item.
  ///
  /// [listItem] is a widget, which will be displayed as item of a list,
  /// such as [ListTile], [Card], etc.
  ///
  /// [headerText] is a text, which will be displayed as header text in
  /// BottomSheetModal.
  ///
  /// [content] is a widget, which will be displayed in BottomSheetModal as main
  /// content.
  const FullInfoDisplayableListItem({
    required this.listItem,
    required this.headerText,
    required this.content,
    super.key,
  });

  final Widget listItem;
  final String headerText;
  final Widget content;

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: () async => showVoidModalBottomSheet(
          context: context,
          headerText: headerText,
          content: content,
        ),
        child: listItem,
      );
}
