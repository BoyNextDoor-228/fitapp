import 'dart:ui';

import 'package:freezed_annotation/freezed_annotation.dart';

import '../settings_values.dart';

part 'theme_settings.freezed.dart';

part 'theme_settings.g.dart';

@freezed
abstract class ThemeSettings with _$ThemeSettings {
  @Assert(
    'contrastLevel >= -1 || contrastLevel <= 1',
    'contrastLevel value must be in range [-1:1]',
  )
  const factory ThemeSettings({
    required ThemeBrightness brightness,
    required int color,
    required double contrastLevel,
  }) = _ThemeSettings;

  factory ThemeSettings.byDefault() {
    final ThemeBrightness defaultBrightness;

    final systemBrightness = PlatformDispatcher.instance.platformBrightness;

    if (systemBrightness == Brightness.light) {
      defaultBrightness = ThemeBrightness.light;
    } else {
      defaultBrightness = ThemeBrightness.dark;
    }

    return ThemeSettings(
      brightness: defaultBrightness,
      color: FitAppColors.deepOrange.color,
      contrastLevel: 0.5,
    );
  }

  factory ThemeSettings.fromJson(Map<String, dynamic> json) =>
      _$ThemeSettingsFromJson(json);

  // https://pub.dev/packages/freezed#adding-getters-and-methods-to-our-models
  const ThemeSettings._();

  bool get isDarkTheme => brightness == ThemeBrightness.dark;
}
