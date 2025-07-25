// ignore_for_file: discarded_futures
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'feature/app/app_scope.dart';
import 'feature/app/page/fallback_app.dart';
import 'feature/settings/bloc/settings_cubit.dart';
import 'feature/user/bloc/user_bloc.dart';
import 'util/theme.dart';

class FitApp extends StatefulWidget {
  /// Creates application root widget.
  const FitApp({super.key});

  @override
  State<FitApp> createState() => _FitAppState();
}

class _FitAppState extends State<FitApp> {
  /// Scope with all application dependencies.
  late IAppScope _appScope;

  /// App scope initialization procedure, which will be finished in [Future].
  late Future<void> _appScopeInitialization;

  void _initScope() {
    _appScope = AppScope();
    _appScopeInitialization = _appScope.init();
  }

  @override
  void initState() {
    super.initState();
    _initScope();
  }

  @override
  Widget build(BuildContext context) => FutureBuilder(
        future: _appScopeInitialization,
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const SafeArea(
              child: FallbackApp(
                child: Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 5,
                  ),
                ),
              ),
            );
          }

          final providers = [
            BlocProvider(
              lazy: false,
              create: (_) => UserBloc(
                userService: _appScope.userService,
              )..add(UserInitializationRequested()),
            ),
            BlocProvider(
              lazy: false,
              create: (_) => SettingsCubit(
                settingsService: _appScope.settingsService,
              ),
            ),
          ];

          return MultiBlocProvider(
            providers: providers,
            child: BlocBuilder<SettingsCubit, SettingsState>(
              builder: (_, state) {
                // If no language was selected in settings, system language is set.
                final locale = state.settings.language == null
                    ? null
                    : Locale(state.settings.language!.languageCode);

                final theme =
                    FitAppTheme(themeSettings: state.settings.themeSettings)
                        .getThemeData();

                return MaterialApp.router(
                  localizationsDelegates: _appScope.localizationsDelegates,
                  supportedLocales: _appScope.supportedLocales,
                  locale: locale,
                  title: _appScope.applicationName,
                  theme: theme,
                  routerConfig: _appScope.router.config(),
                );
              },
            ),
          );
        },
      );
}
