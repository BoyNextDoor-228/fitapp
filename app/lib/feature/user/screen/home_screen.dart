import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../generated/l10n.dart';
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

    Future<void> goToChangeWeightScreen() async {
      router.popUntilRoot();
      await router.replace(const ChangingWeightRoute());
    }

    return FitAppScaffold(
      drawer: const FitAppDrawer(),
      body: Center(
        child: Column(
          spacing: 20,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
    );
  }
}
