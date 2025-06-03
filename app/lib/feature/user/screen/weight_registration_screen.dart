import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../app/widget/fitapp_scaffold.dart';
import '../bloc/user_bloc.dart';
import '../widget/form/weight_form.dart';

@RoutePage()
class WeightRegistrationScreen extends StatelessWidget {
  WeightRegistrationScreen({
    required VoidCallback onUserAppears,
    super.key,
  }) : _onUserAppears = onUserAppears;

  final VoidCallback _onUserAppears;

  late final UserBloc _userBloc;

  @override
  Widget build(BuildContext context) {
    _userBloc = context.read<UserBloc>();

    return FitAppScaffold(
      body: BlocListener<UserBloc, UserState>(
        listenWhen: _listenWhen,
        listener: _listener,
        child: WeightForm(
          onFormSaved: _onSaved,
        ),
      ),
    );
  }

  bool _listenWhen(UserState oldState, UserState newState) =>
      (oldState.user == null) && (newState.user != null);

  void _listener(BuildContext context, UserState state) {
    if (state.user != null) {
      _onUserAppears.call();
    }
  }

  void _onSaved(double userWeight) {
    _userBloc.add(UserCreated(userWeight: userWeight));
  }
}
