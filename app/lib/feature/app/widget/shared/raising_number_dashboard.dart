import 'package:flutter/material.dart';

class RaisingNumberDashboard extends StatefulWidget {
  /// Creates a [Text] widget, which displays an animated raising number.
  ///
  /// [startNumber] is a number, where animation starts from. Default is 0.
  /// [endNumber] is a number, where animation ends.
  /// [countingDuration] is a [Duration], during which animation will be running.
  /// [animationCurve] is a [Curve] to apply on animation. Default is
  /// [Curves.linear].
  /// [textStyle] is style for [Text] widget.
  const RaisingNumberDashboard({
    required this.endNumber,
    required this.countingDuration,
    this.startNumber = 0,
    this.animationCurve = Curves.linear,
    this.textStyle,
    super.key,
  });

  final double startNumber;
  final double endNumber;
  final Curve animationCurve;
  final Duration countingDuration;
  final TextStyle? textStyle;

  @override
  State<RaisingNumberDashboard> createState() => _RaisingNumberDashboardState();
}

class _RaisingNumberDashboardState extends State<RaisingNumberDashboard>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.countingDuration,
      vsync: this,
    );
    final curvedAnimation =
        CurvedAnimation(parent: _controller, curve: widget.animationCurve);

    _animation = Tween<double>(
      begin: widget.startNumber,
      end: widget.endNumber,
    ).animate(curvedAnimation);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Center(
        child: _AnimatedText(
          // This widget needs key as we need this widget to start it's
          // animation each time this widget appears on the screen.
          key: UniqueKey(),
          animation: _animation,
          textStyle: widget.textStyle,
        ),
      );
}

class _AnimatedText extends AnimatedWidget {
  const _AnimatedText({
    required Animation<double> animation,
    TextStyle? textStyle,
    super.key,
  })  : _animation = animation,
        _textStyle = textStyle,
        super(listenable: animation);

  final Animation<double> _animation;
  final TextStyle? _textStyle;

  @override
  Widget build(BuildContext context) => Text(
        _animation.value.toStringAsFixed(1),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: _textStyle,
      );
}
