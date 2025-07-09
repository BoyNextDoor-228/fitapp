import 'package:flutter/material.dart';

class ShimmerCard extends StatefulWidget {
  const ShimmerCard({
    required this.cardHeight,
    super.key,
  });

  final double cardHeight;

  @override
  State<ShimmerCard> createState() => _ShimmerCardState();
}

class _ShimmerCardState extends State<ShimmerCard>
    with TickerProviderStateMixin {
  late AnimationController _animationController;

  late final Animation<double> _backgroundOpacity;

  final _animationDuration = Durations.extralong4;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: _animationDuration,
      vsync: this,
    );

    final curvedAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.bounceInOut,
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
