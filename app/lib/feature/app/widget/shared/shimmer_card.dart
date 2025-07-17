import 'package:flutter/material.dart';

class ShimmerCard extends StatefulWidget {
  /// Creates a card with shimmer effect as it's content. Designed to be shown
  /// during a loading.
  ///
  /// [cardHeight] is a height of card.
  ///
  /// [animationDuration] is a [Duration], during which shimmer animation is
  /// running. Default is [Durations.extralong4].
  ///
  /// [animationCurve] is a [Curve] to apply on animation. Default is
  /// [Curves.bounceInOut].
  const ShimmerCard({
    required this.cardHeight,
    this.animationDuration = Durations.extralong4,
    this.animationCurve = Curves.bounceInOut,
    super.key,
  });

  final double cardHeight;
  final Duration animationDuration;
  final Curve animationCurve;

  @override
  State<ShimmerCard> createState() => _ShimmerCardState();
}

class _ShimmerCardState extends State<ShimmerCard>
    with TickerProviderStateMixin {
  late AnimationController _animationController;

  late final Animation<double> _backgroundOpacity;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: widget.animationDuration,
      vsync: this,
    );

    final curvedAnimation = CurvedAnimation(
      parent: _animationController,
      curve: widget.animationCurve,
    );

    _backgroundOpacity = Tween<double>(
      begin: 0.3,
      end: 0.7,
    ).animate(curvedAnimation);

    _animationController.repeat(reverse: true);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => AnimatedBuilder(
        animation: _animationController,
        builder: (_, __) => Card(
          color: Theme.of(context)
              .cardColor
              .withValues(alpha: _backgroundOpacity.value),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: SizedBox(
              width: double.infinity,
              height: widget.cardHeight,
            ),
          ),
        ),
      );
}
