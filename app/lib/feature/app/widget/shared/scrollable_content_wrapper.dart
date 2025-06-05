import 'package:flutter/material.dart';

class ScrollableContentWrapper extends StatelessWidget {
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
      child: SizedBox(
        height: height,
        child: child,
      ),
    );
  }
}
