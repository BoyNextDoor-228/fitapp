// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Settings _$SettingsFromJson(Map<String, dynamic> json) => _Settings(
      themeSettings:
          ThemeSettings.fromJson(json['themeSettings'] as Map<String, dynamic>),
      language: $enumDecodeNullable(_$FitAppLanguagesEnumMap, json['language']),
    );

Map<String, dynamic> _$SettingsToJson(_Settings instance) => <String, dynamic>{
      'themeSettings': instance.themeSettings.toJson(),
      'language': _$FitAppLanguagesEnumMap[instance.language],
    };

const _$FitAppLanguagesEnumMap = {
  FitAppLanguages.russian: 'russian',
  FitAppLanguages.english: 'english',
};
