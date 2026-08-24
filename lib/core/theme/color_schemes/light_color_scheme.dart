import 'package:flutter/material.dart';

const ColorScheme lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: Color(0xFF3B82F6), // Blue-500 — bright, clear sky blue
  onPrimary: Colors.white,
  secondary: Color(0xFFDCEBFF), // Pale sky-blue — secondary fills
  onSecondary: Color(0xFF0F3460), // Deep blue text on secondary
  surface: Color(0xFFF8FAFC), // Slate-50 — near-white main background
  onSurface: Color(0xFF0F3460), // Deep blue — primary text
  primaryContainer: Color(
    0xFFE2E8F0,
  ), // Slate-200 — one step off white, cards/containers
  onPrimaryContainer: Color(0xFF0A1F3D), // Near-navy text on primaryContainer
  surfaceContainerHighest: Color(0xFFE8F1FF), // Soft blue-tinted surface
  error: Color(0xFFB3261E),
  onError: Colors.white,
  outline: Color(0xFFB8CDE8), // Muted blue-grey border
);
