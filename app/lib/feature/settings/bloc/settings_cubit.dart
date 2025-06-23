import 'package:bloc/bloc.dart';

import '../../../service/settings_service.dart';
import '../domain/settings/settings.dart';
import '../domain/settings_values.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit({required SettingsService settingsService})
      : _settingsService = settingsService,
        super(SettingsState(settings: settingsService.settings));

  final SettingsService _settingsService;

  Future<void> setThemeBrightness({required ThemeBrightness brightness}) async {
    try {
      await _settingsService.editThemeBrightness(brightness: brightness);
      emit(
        SettingsState(
          settings: _settingsService.settings.copyWith(
            themeSettings: _settingsService.settings.themeSettings
                .copyWith(brightness: brightness),
          ),
        ),
      );
    } on Exception {
      emit(
        SettingsState(
          settings: _settingsService.settings,
          errorOccurred: true,
        ),
      );
    }
  }

  Future<void> setThemeColor({required int color}) async {
    try {
      await _settingsService.editThemeColor(color: color);
      emit(
        SettingsState(
          settings: _settingsService.settings.copyWith(
            themeSettings:
                _settingsService.settings.themeSettings.copyWith(color: color),
          ),
        ),
      );
    } on Exception {
      emit(
        SettingsState(
          settings: _settingsService.settings,
          errorOccurred: true,
        ),
      );
    }
  }

  Future<void> setThemeContrastLevel({required double contrastLevel}) async {
    try {
      await _settingsService.editThemeContrastLevel(
        contrastLevel: contrastLevel,
      );
      emit(
        SettingsState(
          settings: _settingsService.settings.copyWith(
            themeSettings: _settingsService.settings.themeSettings
                .copyWith(contrastLevel: contrastLevel),
          ),
        ),
      );
    } on Exception {
      emit(
        SettingsState(
          settings: _settingsService.settings,
          errorOccurred: true,
        ),
      );
    }
  }

  Future<void> setAppLanguage({required FitAppLanguages language}) async {
    try {
      await _settingsService.editAppLanguage(language: language);
      emit(SettingsState(settings: _settingsService.settings));
    } on Exception {
      emit(
        SettingsState(
          settings: _settingsService.settings,
          errorOccurred: true,
        ),
      );
    }
  }
}
