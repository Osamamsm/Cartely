import 'package:e_commerce/core/theme/color_schemes/dark_color_scheme.dart';
import 'package:e_commerce/core/theme/components/button_theme.dart';
import 'package:e_commerce/core/theme/components/input_theme.dart';
import 'package:e_commerce/core/theme/extensions/blurry_background_theme.dart';
import 'package:e_commerce/core/theme/typography.dart';
import 'package:flutter/material.dart';

ThemeData buildDarkTheme() {
  return ThemeData(
    useMaterial3: true,
    colorScheme: darkColorScheme,
    scaffoldBackgroundColor: const Color(0xFF0F172A),
    inputDecorationTheme: InputThemes.darkInputTheme,
    elevatedButtonTheme: ButtonThemes.elevatedButtonTheme(darkColorScheme),
    outlinedButtonTheme: ButtonThemes.outlinedGlassButtonTheme(darkColorScheme),
    textButtonTheme: ButtonThemes.textButtonTheme(darkColorScheme),
    dividerTheme: const DividerThemeData(
      color: Color(0xFF1E293B), // Slate-800
      thickness: 1,
    ),
    textTheme: AppTypography.textTheme.apply(
  bodyColor: darkColorScheme.onSurface,      // Color(0xFFF1F5F9)
      displayColor: darkColorScheme.onSurface,
    ),
    extensions: const [
      BlurryBackgroundTheme(
        primaryBlob: Color(0xFF1E3A5F),   // Deep navy
        secondaryBlob: Color(0xFF1E293B), // Slate-800
      ),
    ],
  );
}