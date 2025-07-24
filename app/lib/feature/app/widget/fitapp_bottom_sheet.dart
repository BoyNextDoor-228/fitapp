import 'package:flutter/material.dart';

class FitAppBottomSheet extends StatelessWidget {
  /// Creates a content to be placed in a [BottomSheet].
  ///
  /// [headerText] is a text, which describes what this [BottomSheet] content
  /// is about.
  ///
  /// [content] is a [Widget] to be shown as [BottomSheet] content.
  ///
  /// [height] is a height of [BottomSheet]. Default is 75% of current screen
  /// height (corresponding to screen orientation).
  const FitAppBottomSheet({
    required this.headerText,
    required this.content,
    this.height,
    super.key,
  });

  final String headerText;
  final Widget content;
  final double? height;

  @override
  Widget build(BuildContext context) {
    final defaultHeight = MediaQuery.sizeOf(context).height * 0.9;

    return SizedBox(
      width: double.infinity,
      height: height ?? defaultHeight,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            _Header(
              headerText: headerText,
            ),
            Expanded(
              child: content,
            ),
          ],
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({required this.headerText});

  final String headerText;

  @override
  Widget build(BuildContext context) => Row(
        children: [
          Expanded(
            child: Center(
              child: Text(
                headerText,
                style: Theme.of(context).textTheme.titleMedium,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      );
}
