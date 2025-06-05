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
  const FitApp({super.key});

  @override
  State<FitApp> createState() => _FitAppState();
}

class _FitAppState extends State<FitApp> {
  late IAppScope _appScope;
  late Future<void> _scopeFuture;

  @override
  void initState() {
    super.initState();

    _initScope();
  }

  @override
  Widget build(BuildContext context) => FutureBuilder(
        future: _scopeFuture,
        builder: (_, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const SafeArea(
              child: FallbackApp(child: CircularProgressIndicator()),
            );
          }

          return MultiBlocProvider(
            providers: [
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
            ],
            child: BlocBuilder<SettingsCubit, SettingsState>(
              builder: (BuildContext context, state) => MaterialApp.router(
                localizationsDelegates: _appScope.localizationsDelegates,
                supportedLocales: _appScope.supportedLocales,
                // If no language was selected in settings, system language is set.
                locale: state.settings.language == null
                    ? null
                    : Locale(state.settings.language!.language),
                title: _appScope.applicationName,
                theme: FitAppTheme(themeSettings: state.settings.themeSettings)
                    .getThemeData(),
                routerConfig: _appScope.router.config(),
              ),
            ),
          );
        },
      );

  void _initScope() {
    _appScope = AppScope();
    _scopeFuture = _appScope.init();
  }
}
