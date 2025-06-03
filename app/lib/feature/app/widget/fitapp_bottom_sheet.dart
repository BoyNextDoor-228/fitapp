import 'package:flutter/material.dart';

class FitAppBottomSheet extends StatelessWidget {
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
  Widget build(BuildContext context) => SizedBox(
        width: double.infinity,
        height: height ?? MediaQuery.sizeOf(context).height * 0.75,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              _Header(
                headerText: headerText,
              ),
              Expanded(
                flex: 9,
                child: content,
              ),
            ],
          ),
        ),
      );
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

  // @override
  // Widget build(BuildContext context) => Stack(
  //       alignment: AlignmentDirectional.topCenter,
  //       children: [
  //         Positioned(
  //           top: 15,
  //           child: Text(
  //               headerText* 100,
  //               maxLines: 1,
  //             overflow: TextOverflow.ellipsis,
  //           ),
  //         ),
  //         Positioned.directional(
  //           textDirection: TextDirection.ltr,
  //           end: 0,
  //           child: IconButton(
  //             icon: const Icon(Icons.close),
  //             onPressed: () => Navigator.pop(context),
  //           ),
  //         ),
  //       ],
  //     );
}
