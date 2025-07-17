import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../generated/l10n.dart';
import '../../../tool/user_status_to_string.dart';
import '../../app/widget/fit_app_snackbar_content.dart';
import '../../app/widget/fitapp_scaffold.dart';
import '../../app/widget/page_view_control_button.dart';
import '../../settings/bloc/settings_cubit.dart';
import '../../settings/domain/settings_values.dart';
import '../bloc/user_bloc.dart';
import '../widget/introduction_subpage/language_selection_subpage.dart';
import '../widget/introduction_subpage/weight_registration_subpage.dart';

@RoutePage()
class IntroductionScreen extends StatefulWidget {
  /// Screen to be shown on very first application run.
  ///
  /// [onUserAppears] is a callback, which is called when application creates
  /// virtual user.
  const IntroductionScreen({
    required VoidCallback onUserAppears,
    super.key,
  }) : _onUserAppears = onUserAppears;

  final VoidCallback _onUserAppears;

  @override
  State<IntroductionScreen> createState() => _IntroductionScreenState();
}

class _IntroductionScreenState extends State<IntroductionScreen> {
  late final SettingsCubit _settingsCubit;

  final _pageViewController = PageController();

  int _currentPageIndex = 0;

  final _pageTransitionDuration = Durations.long2;
  final _pageTransitionCurve = Curves.fastLinearToSlowEaseIn;

  Future<void> _goToNextPage() async => _pageViewController.nextPage(
        duration: _pageTransitionDuration,
        curve: _pageTransitionCurve,
      );

  Future<void> _goToPreviousPage() async => _pageViewController.previousPage(
        duration: _pageTransitionDuration,
        curve: _pageTransitionCurve,
      );

  Future<void> _onLanguageSelected(FitAppLanguages language) async {
    await _settingsCubit.setAppLanguage(language: language);
    await _goToNextPage();
  }

  void _setPageCurrentIndex(int newIndex) => setState(() {
        _currentPageIndex = newIndex;
      });

  @override
  void initState() {
    super.initState();
    _settingsCubit = context.read<SettingsCubit>();
  }

  @override
  Widget build(BuildContext context) {
    final text = S.of(context);

    final subpages = [
      LanguageSelectionSubpage(
        onLanguageSelected: _onLanguageSelected,
      ),
      WeightRegistrationSubpage(onUserAppears: widget._onUserAppears),
    ];

    void userErrorListener(BuildContext context, UserState state) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: FitAppSnackBarContent(
            snackBarText: userErrorToLocalizedText(text, state.errorMessage!),
            messageType: SnackBarMessageType.error,
          ),
        ),
      );
    }

    return FitAppScaffold(
      body: BlocListener<UserBloc, UserState>(
        listenWhen: (_, newState) => newState.errorMessage != null,
        listener: userErrorListener,
        child: Column(
          children: [
            Expanded(
              child: PageView(
                physics: const NeverScrollableScrollPhysics(),
                controller: _pageViewController,
                onPageChanged: _setPageCurrentIndex,
                children: subpages,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PageViewControlButton(
                  icon: const Icon(
                    Icons.arrow_back,
                    size: 40,
                  ),
                  // If first subpage is shown, 'previous subpage button' can
                  // not be active.
                  onTap: _currentPageIndex != 0 ? _goToPreviousPage : null,
                ),
                PageViewControlButton(
                  icon: const Icon(
                    Icons.arrow_forward,
                    size: 40,
                  ),
                  // If last subpage is shown, 'next subpage button' can
                  // not be active.
                  onTap: _currentPageIndex != subpages.length - 1
                      ? _goToNextPage
                      : null,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
