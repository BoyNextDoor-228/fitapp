part of 'settings_cubit.dart';

class SettingsState {
  const SettingsState({
    required this.settings,
    this.errorOccurred = false,
  });

  final Settings settings;
  final bool errorOccurred;
}
