import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';

import '../settings_values.dart';
import '../theme_settings/theme_settings.dart';

part 'settings.freezed.dart';

part 'settings.g.dart';

@freezed
abstract class Settings with _$Settings {
  const factory Settings({
    required ThemeSettings themeSettings,
    required FitAppLanguages? language,
  }) = _Settings;

  factory Settings.byDefault() => Settings(
        themeSettings: ThemeSettings.byDefault(),
        language: null,
      );

  factory Settings.fromJson(Map<String, dynamic> json) =>
      _$SettingsFromJson(json);

  // https://pub.dev/packages/freezed#adding-getters-and-methods-to-our-models
  const Settings._();

  static FitAppLanguages recognizeLanguage() {
    final systemLanguage = Platform.localeName;

    if (systemLanguage
        .toLowerCase()
        .startsWith(FitAppLanguages.russian.language)) {
      return FitAppLanguages.russian;
    }

    return FitAppLanguages.english;
  }
}
