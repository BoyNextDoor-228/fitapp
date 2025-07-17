import 'package:flutter/material.dart';

import '../../../tool/bottom_sheet_provider.dart';

class FullInfoDisplayableListItem extends StatelessWidget {
  /// Displays a [listItem] in a list this widget was called from.
  ///
  /// On tap action opens a [BottomSheet], which contains full information
  /// about subject of this list item.
  ///
  /// [listItem] is a [Widget], which will be displayed as item of a list,
  /// such as [ListTile], [Card], etc.
  ///
  /// [headerText] is a text, which will be displayed as header text in
  /// [BottomSheet].
  ///
  /// [content] is a [Widget], which will be displayed in [BottomSheet] as main
  /// content.
  ///
  /// [height] is a height of [BottomSheet].
  const FullInfoDisplayableListItem({
    required this.listItem,
    required this.headerText,
    required this.content,
    this.height,
    super.key,
  });

  final Widget listItem;
  final String headerText;
  final Widget content;
  final double? height;

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: () async => showVoidModalBottomSheet(
          height: height,
          context: context,
          headerText: headerText,
          content: content,
        ),
        child: listItem,
      );
}
