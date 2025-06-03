import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/user_bloc.dart';
import '../form/weight_form.dart';

class WeightRegistrationSubpage extends StatelessWidget {
  const WeightRegistrationSubpage({
    required this.onUserAppears,
    super.key,
  });

  final VoidCallback onUserAppears;

  @override
  Widget build(BuildContext context) {
    void createUser(double userWeight) {
      context.read<UserBloc>().add(UserCreated(userWeight: userWeight));
    }

    final iconColor = Theme.of(context).colorScheme.tertiaryContainer;

    return Center(
      child: SingleChildScrollView(
        child: Column(
          spacing: 10,
          children: [
            Icon(
              Icons.rocket_launch,
              size: 200,
              color: iconColor,
            ),
            BlocListener<UserBloc, UserState>(
              listenWhen: _userAppears,
              listener: _listener,
              child: WeightForm(
                onFormSaved: createUser,
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool _userAppears(UserState oldState, UserState newState) =>
      (oldState.user == null) && (newState.user != null);

  void _listener(BuildContext context, UserState state) {
    if (state.user != null) {
      onUserAppears.call();
    }
  }
}
