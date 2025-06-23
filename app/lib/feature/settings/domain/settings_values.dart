import 'package:freezed_annotation/freezed_annotation.dart';

enum ThemeBrightness {
  @JsonValue('dark')
  dark,
  @JsonValue('light')
  light,
}

enum FitAppColors {
  baseColor(0xff6750a4),
  indigo(0xFF1A237E),
  blue(0xFF1E88E5),
  teal(0xFF26A69A),
  green(0xFF66BB6A),
  orange(0xFFFB8C00),
  deepOrange(0xFFF4511E),
  pink(0xFFEC407A),
  brightBlue(0xFF0000FF),
  brightGreen(0xFF00FF00),
  brightRed(0xFFFF0000),

  black(0xFF000000),
  white(0xFFFFFFFF);

  const FitAppColors(this.color);
  final int color;
}

enum FitAppLanguages {
  russian('ru', 'Русский'),
  english('en', 'English');

  const FitAppLanguages(this.languageCode, this.nativeCaption);
  final String languageCode;
  final String nativeCaption;
}
