import 'package:flutter/material.dart';

import '../feature/app/widget/fit_app_snackbar_content.dart';
import '../feature/user/bloc/user_bloc.dart';
import '../generated/l10n.dart';
import 'user_status_to_string.dart';

/// Reacts on [UserState] changes and shows corresponding [SnackBar]s
/// [state] is [UserState] to react on.
void userStateListener(BuildContext context, UserState state) {
  final text = S.current;

  final showSnackBar = ScaffoldMessenger.of(context).showSnackBar;

  if (state.status == UserStatus.error) {
    showSnackBar(
      SnackBar(
        content: FitAppSnackBarContent(
          snackBarText: userErrorToLocalizedText(text, state.errorMessage!),
          messageType: SnackBarMessageType.error,
        ),
      ),
    );
  }

  if (state.status == UserStatus.success) {
    showSnackBar(
      SnackBar(
        content: FitAppSnackBarContent(
          snackBarText: userSuccessToLocalizedText(text, state.successMessage!),
          messageType: SnackBarMessageType.success,
        ),
      ),
    );
  }
}
