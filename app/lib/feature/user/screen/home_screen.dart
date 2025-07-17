import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../generated/l10n.dart';
import '../../../tool/route_provider.dart';
import '../../app/widget/fitapp_drawer.dart';
import '../../app/widget/fitapp_scaffold.dart';
import '../../app/widget/shared/raising_number_dashboard.dart';
import '../../navigation/app_router.dart';
import '../../user/bloc/user_bloc.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final text = S.of(context);
    final router = context.router;
    final userWeight = context.read<UserBloc>().state.user!.weight;

    Future<void> goToChangeWeightScreen() async =>
        goToRoute(router: router, route: const ChangingWeightRoute());

    return FitAppScaffold(
      drawer: const FitAppDrawer(),
      body: SafeArea(
        child: RepaintBoundary(
          child: Column(
            spacing: 20,
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //const OpenMenuAnimatedTip(),
              Text(
                text.yourCurrentWeightIs,
                style: textTheme.headlineSmall,
              ),
              RaisingNumberDashboard(
                endNumber: userWeight,
                countingDuration: const Duration(seconds: 1),
                animationCurve: Curves.easeInOut,
                textStyle: textTheme.displayMedium,
              ),
              OutlinedButton(
                onPressed: goToChangeWeightScreen,
                child: Text(text.changeWeight),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OpenMenuAnimatedTip extends StatefulWidget {
  const OpenMenuAnimatedTip({super.key});

  @override
  State<OpenMenuAnimatedTip> createState() => _OpenMenuAnimatedTipState();
}

class _OpenMenuAnimatedTipState extends State<OpenMenuAnimatedTip>
    with TickerProviderStateMixin {
  late final AnimationController _animationController;

  final _animationDuration = Durations.long4;
  final _animationCurve = Curves.easeInCubic;

  late final Animation<AlignmentGeometry> _iconAlignment;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: _animationDuration,
      vsync: this,
    );
    if (mounted) {
      _animationController.repeat();
    }

    final animation = CurvedAnimation(
      parent: _animationController,
      curve: Interval(0, 1, curve: _animationCurve),
    );

    _iconAlignment = Tween<AlignmentGeometry>(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
    ).animate(animation);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final text = S.of(context);

    return Row(
      children: [
        Expanded(
          child: AnimatedBuilder(
            animation: _animationController,
            builder: (_, __) => Align(
              alignment: _iconAlignment.value,
              child: const Icon(Icons.chevron_right),
            ),
          ),
        ),
        Expanded(
          flex: 4,
          child: Text(text.dragLeftSideRightToOpenMenu),
        ),
      ],
    );
  }
}
