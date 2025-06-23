import 'package:flutter/material.dart';

import '../feature/settings/domain/settings_values.dart';
import '../feature/settings/domain/theme_settings/theme_settings.dart';

class FitAppTheme {
  FitAppTheme({required ThemeSettings themeSettings}) {
    _themeSettings = themeSettings;
    _init();
  }

  void _init() {
    _colorScheme = ColorScheme.fromSeed(
      brightness: _brightness,
      seedColor: Color(_themeSettings.color),
      contrastLevel: _themeSettings.contrastLevel,
      dynamicSchemeVariant: DynamicSchemeVariant.fidelity,
    ).copyWith(error: Colors.red);

    final outlinedBorderShape = RoundedRectangleBorder(
      side: BorderSide(
        color: _colorScheme.inversePrimary.withValues(alpha: 0.3),
      ),
      borderRadius: BorderRadius.circular(10),
    );

    final cardTheme = CardTheme(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      color: _colorScheme.onPrimaryContainer.withValues(alpha: 0.5),
      elevation: 1,
      shape: outlinedBorderShape,
    );

    final dividerTheme = DividerThemeData(color: Color(_themeSettings.color));

    final floatingActionButtonTheme = FloatingActionButtonThemeData(
      backgroundColor: _colorScheme.primaryContainer.withValues(alpha: 0.7),
    );

    final appBarTheme = AppBarTheme(
      // Disable changing AppBar color when scrolling.
      scrolledUnderElevation: 0,
      backgroundColor: _colorScheme.onPrimary.withValues(alpha: 0.5),
    );

    final drawerTheme = DrawerThemeData(
      backgroundColor: _colorScheme.surface.withValues(alpha: 0.5),
    );

    final bottomSheetTheme = BottomSheetThemeData(
      backgroundColor: _colorScheme.onPrimaryContainer,
    );

    final dialogTheme = DialogThemeData(
      backgroundColor: _colorScheme.onPrimaryContainer,
      shape: outlinedBorderShape,
    );

    _lightTheme = ThemeData.light(useMaterial3: true).copyWith(
      colorScheme: _colorScheme,
      cardTheme: cardTheme,
      dividerTheme: dividerTheme,
      floatingActionButtonTheme: floatingActionButtonTheme,
      appBarTheme: appBarTheme,
      drawerTheme: drawerTheme,
      bottomSheetTheme: bottomSheetTheme,
      dialogTheme: dialogTheme,
    );

    _darkTheme = ThemeData.dark(useMaterial3: true).copyWith(
      colorScheme: _colorScheme,
      cardTheme: cardTheme,
      dividerTheme: dividerTheme,
      floatingActionButtonTheme: floatingActionButtonTheme,
      appBarTheme: appBarTheme,
      drawerTheme: drawerTheme,
      bottomSheetTheme: bottomSheetTheme,
      dialogTheme: dialogTheme,
    );
  }

  late final ThemeSettings _themeSettings;

  late final ColorScheme _colorScheme;

  late final ThemeData _lightTheme;
  late final ThemeData _darkTheme;

  Brightness get _brightness =>
      _themeSettings.brightness == ThemeBrightness.light
          ? Brightness.light
          : Brightness.dark;

  ThemeData getThemeData() {
    switch (_themeSettings.brightness) {
      case ThemeBrightness.light:
        return _lightTheme;

      case ThemeBrightness.dark:
        return _darkTheme;
    }
  }
}
