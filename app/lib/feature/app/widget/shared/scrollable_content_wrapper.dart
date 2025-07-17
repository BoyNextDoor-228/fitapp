import 'package:flutter/material.dart';

class ScrollableContentWrapper extends StatelessWidget {
  /// Creates a vertically scrollable wrapper for content, passed as [child].
  const ScrollableContentWrapper({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).longestSide -
        kToolbarHeight -
        kBottomNavigationBarHeight;

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: SizedBox(
        height: height,
        child: child,
      ),
    );
  }
}
