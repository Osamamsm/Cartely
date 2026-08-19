import 'package:flutter/material.dart';

const ColorScheme darkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: Color(0xFF60A5FA), // Blue-400 — bright enough on dark bg
  onPrimary: Color(0xFF0F172A), // Dark navy text on primary
  secondary: Color(0xFF1E3A5F), // Dark navy — secondary fills
  onSecondary: Color(0xFFE2E8F0), // Slate-200 text on secondary
  surface: Color(0xFF0F172A), // Slate-900 — main background
  onSurface: Color(0xFFF1F5F9), // Slate-100 — primary text
  primaryContainer: Color(0xFF1E293B), // Slate-800 — cards, containers
  onPrimaryContainer: Color(0xFFE2E8F0),
  surfaceContainerHighest: Color(0xFF1E293B),
  error: Color.fromARGB(255, 218, 70, 70), // Red-300 — softer on dark bg
  onError: Color(0xFF7F1D1D),
  outline: Color(0xFF334155), // Slate-700 — subtle borders
);
