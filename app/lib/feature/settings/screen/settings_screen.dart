import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../generated/l10n.dart';
import '../../app/widget/fit_app_snackbar_content.dart';
import '../../app/widget/fitapp_appbar.dart';
import '../../app/widget/fitapp_drawer.dart';
import '../../app/widget/fitapp_scaffold.dart';
import '../bloc/settings_cubit.dart';
import '../domain/settings_values.dart';
import '../widget/color_selector.dart';
import '../widget/contrast_level_selector.dart';
import '../widget/language_selector.dart';
import '../widget/settings_list_item.dart';

@RoutePage()
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final text = S.of(context);

    final settings = context.watch<SettingsCubit>().state.settings;
    final settingsCubit = context.read<SettingsCubit>();

    // ignore: avoid_positional_boolean_parameters
    Future<void> setIsThemeDark(bool value) async {
      await settingsCubit.setThemeBrightness(
        brightness: value ? ThemeBrightness.dark : ThemeBrightness.light,
      );
    }

    Future<void> setThemeColor(int color) async =>
        settingsCubit.setThemeColor(color: color);

    Future<void> setThemeContrastLevel(ContrastLevels value) async =>
        settingsCubit.setThemeContrastLevel(contrastLevel: value);

    Future<void> setAppLanguage(FitAppLanguages language) async =>
        settingsCubit.setAppLanguage(language: language);

    void settingsErrorListener(BuildContext context, SettingsState state) {
      if (state.errorOccurred) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: FitAppSnackBarContent(
              snackBarText: text.anErrorOccurred,
              messageType: SnackBarMessageType.error,
            ),
          ),
        );
      }
    }

    return FitAppScaffold(
      appBar: FitappAppbar.regularPage(title: text.settings),
      drawer: const FitAppDrawer(),
      body: BlocListener<SettingsCubit, SettingsState>(
        bloc: settingsCubit,
        listener: settingsErrorListener,
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            SettingsListItem(
              description: text.darkMode,
              handler: Switch(
                value: settings.themeSettings.isDarkTheme,
                onChanged: setIsThemeDark,
              ),
            ),
            SettingsListItem(
              description: text.interfaceMainColor,
              handler: ColorSelector(
                captionText: text.selectColor,
                onColorSelected: setThemeColor,
                initialColor: Color(settings.themeSettings.color),
                colors:
                    FitAppColors.values.map((color) => color.color).toList(),
              ),
            ),
            SettingsListItem(
              description: text.interfaceContrastLevel,
              descriptionFlex: 1,
              handler: ContrastLevelSelector(
                initialContrastLevel: settings.themeSettings.contrastLevel,
                onSelected: (value) async => setThemeContrastLevel(value!),
              ),
            ),
            SettingsListItem(
              description: text.interfaceLanguage,
              handler: LanguageSelector(
                captionText: text.selectLanguage,
                onLanguageSelected: setAppLanguage,
                initialLanguage: settings.language,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
