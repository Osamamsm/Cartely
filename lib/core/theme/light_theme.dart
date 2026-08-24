import 'package:e_commerce/core/theme/color_schemes/light_color_scheme.dart';
import 'package:e_commerce/core/theme/components/button_theme.dart';
import 'package:e_commerce/core/theme/components/input_theme.dart';
import 'package:e_commerce/core/theme/extensions/blurry_background_theme.dart';
import 'package:e_commerce/core/theme/typography.dart';
import 'package:flutter/material.dart';

ThemeData buildLightTheme() {
  return ThemeData(
    useMaterial3: true,
    colorScheme: lightColorScheme,
    scaffoldBackgroundColor: const Color(0xFFFAFBFF),
    inputDecorationTheme: InputThemes.lightInputTheme,
    elevatedButtonTheme: ButtonThemes.elevatedButtonTheme(lightColorScheme),
    outlinedButtonTheme: ButtonThemes.outlinedGlassButtonTheme(
      lightColorScheme,
    ),
    textButtonTheme: ButtonThemes.textButtonTheme(lightColorScheme),
    dividerTheme: const DividerThemeData(
      color: Color(0xFFE2E8F0), // Slate-200 — light, subtle divider
      thickness: 1,
    ),
    textTheme: AppTypography.textTheme.apply(
      bodyColor: lightColorScheme.onSurface, // Color(0xFF0F3460)
      displayColor: lightColorScheme.onSurface,
    ),
    extensions: const [
      BlurryBackgroundTheme(
        primaryBlob: Color(0xFF3B82F6), // Blue-500 — matches new primary
        secondaryBlob: Color(0xFF93C5FD), // Blue-300 — lighter accent blob
      ),
    ],
  );
}
