import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class FitAppScaffold extends StatelessWidget {
  /// Wrapper of a [Scaffold]. Creates a [Scaffold] with a fancy background.
  ///
  /// All parameters are identical to original [Scaffold].
  const FitAppScaffold({
    super.key,
    this.appBar,
    this.body,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.floatingActionButtonAnimator,
    this.persistentFooterButtons,
    this.persistentFooterAlignment = AlignmentDirectional.centerEnd,
    this.drawer,
    this.onDrawerChanged,
    this.endDrawer,
    this.onEndDrawerChanged,
    this.bottomNavigationBar,
    this.bottomSheet,
    this.backgroundColor,
    this.resizeToAvoidBottomInset,
    this.primary = true,
    this.drawerDragStartBehavior = DragStartBehavior.start,
    this.extendBody = false,
    this.extendBodyBehindAppBar = false,
    this.drawerScrimColor,
    this.drawerEdgeDragWidth,
    this.drawerEnableOpenDragGesture = true,
    this.endDrawerEnableOpenDragGesture = true,
    this.restorationId,
  });

  final bool extendBody;

  final bool extendBodyBehindAppBar;

  final PreferredSizeWidget? appBar;

  final Widget? body;

  final Widget? floatingActionButton;

  final FloatingActionButtonLocation? floatingActionButtonLocation;

  final FloatingActionButtonAnimator? floatingActionButtonAnimator;

  final List<Widget>? persistentFooterButtons;

  final AlignmentDirectional persistentFooterAlignment;

  final Widget? drawer;

  final DrawerCallback? onDrawerChanged;

  final Widget? endDrawer;

  final DrawerCallback? onEndDrawerChanged;

  final Color? drawerScrimColor;

  final Color? backgroundColor;

  final Widget? bottomNavigationBar;

  final Widget? bottomSheet;

  final bool? resizeToAvoidBottomInset;

  final bool primary;

  final DragStartBehavior drawerDragStartBehavior;

  final double? drawerEdgeDragWidth;

  final bool drawerEnableOpenDragGesture;

  final bool endDrawerEnableOpenDragGesture;

  final String? restorationId;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      key: key,
      appBar: appBar,
      floatingActionButton: floatingActionButton,
      floatingActionButtonLocation: floatingActionButtonLocation,
      floatingActionButtonAnimator: floatingActionButtonAnimator,
      persistentFooterButtons: persistentFooterButtons,
      persistentFooterAlignment: persistentFooterAlignment,
      drawer: drawer,
      onDrawerChanged: onDrawerChanged,
      endDrawer: endDrawer,
      onEndDrawerChanged: onEndDrawerChanged,
      bottomNavigationBar: bottomNavigationBar,
      bottomSheet: bottomSheet,
      backgroundColor: backgroundColor,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      primary: primary,
      drawerDragStartBehavior: drawerDragStartBehavior,
      extendBody: extendBody,
      extendBodyBehindAppBar: extendBodyBehindAppBar,
      drawerScrimColor: drawerScrimColor,
      drawerEdgeDragWidth: drawerEdgeDragWidth,
      drawerEnableOpenDragGesture: drawerEnableOpenDragGesture,
      endDrawerEnableOpenDragGesture: endDrawerEnableOpenDragGesture,
      restorationId: restorationId,
      body: Stack(
        children: [
          CustomPaint(
            painter: _BackgroundPainter(
              primaryColor: colorScheme.inversePrimary,
              secondaryColor: colorScheme.tertiaryContainer,
              backgroundColor: colorScheme.onTertiary,
            ),
            size: MediaQuery.sizeOf(context),
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
            child: const SizedBox.expand(),
          ),
          ColoredBox(
            color: colorScheme.onPrimary.withValues(alpha: 0.5),
            child: const SizedBox.expand(),
          ),
          body ?? const SizedBox.shrink(),
        ],
      ),
    );
  }
}

class _BackgroundPainter extends CustomPainter {
  const _BackgroundPainter({
    required this.primaryColor,
    required this.secondaryColor,
    required this.backgroundColor,
  });

  final Color primaryColor;
  final Color secondaryColor;
  final Color backgroundColor;

  @override
  void paint(Canvas canvas, Size size) => canvas
    ..drawPaint(Paint()..color = backgroundColor)
    ..drawCircle(
      Offset(size.width / 4, size.height / 4),
      300,
      Paint()..color = primaryColor,
    )
    ..drawCircle(
      Offset(size.width - 10, size.height - 20),
      300,
      Paint()..color = secondaryColor,
    );

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
