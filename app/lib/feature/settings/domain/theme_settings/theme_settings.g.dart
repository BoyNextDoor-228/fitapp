// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ThemeSettings _$ThemeSettingsFromJson(Map<String, dynamic> json) =>
    _ThemeSettings(
      brightness: $enumDecode(_$ThemeBrightnessEnumMap, json['brightness']),
      color: (json['color'] as num).toInt(),
      contrastLevel:
          $enumDecode(_$ContrastLevelsEnumMap, json['contrastLevel']),
    );

Map<String, dynamic> _$ThemeSettingsToJson(_ThemeSettings instance) =>
    <String, dynamic>{
      'brightness': _$ThemeBrightnessEnumMap[instance.brightness]!,
      'color': instance.color,
      'contrastLevel': _$ContrastLevelsEnumMap[instance.contrastLevel]!,
    };

const _$ThemeBrightnessEnumMap = {
  ThemeBrightness.dark: 'dark',
  ThemeBrightness.light: 'light',
};

const _$ContrastLevelsEnumMap = {
  ContrastLevels.low: 'low',
  ContrastLevels.medium: 'medium',
  ContrastLevels.high: 'high',
};
