import 'package:flutter/material.dart';

class InputThemes {
  static OutlineInputBorder _border(Color color, {double width = 1}) =>
      OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(color: color, width: width),
      );

  static const EdgeInsets _padding = EdgeInsets.symmetric(
    horizontal: 16,
    vertical: 16,
  );

  static InputDecorationTheme _buildTheme({
    required Color fillColor,
    required Color borderColor,
    required Color focusedBorderColor,
    required TextStyle hintStyle,
  }) {
    return InputDecorationTheme(
      filled: true,
      fillColor: fillColor,
      hintStyle: hintStyle,
      contentPadding: _padding,
      border: _border(borderColor),
      enabledBorder: _border(borderColor),
      focusedBorder: _border(focusedBorderColor, width: 2),
      errorBorder: _border(const Color(0xFFDC2626)),
      focusedErrorBorder: _border(const Color(0xFFDC2626), width: 2),
    );
  }

  static final InputDecorationTheme lightInputTheme = _buildTheme(
    fillColor: Colors.white.withValues(alpha: 0.55),        // glass — translucent white
    borderColor: const Color(0xFFBFD7F5),               // Blue-100/200 — soft blue border
    focusedBorderColor: const Color(0xFF2563EB),        // Blue-600
    hintStyle: const TextStyle(
      color: Color(0xFF64748B), // Slate-500 — slightly darker for legibility on glass
      fontSize: 14,
    ),
  );

  static final InputDecorationTheme darkInputTheme = _buildTheme(
    fillColor: const Color(0xFF1E293B).withValues(alpha: 0.5), // glass — translucent slate-800
    borderColor: const Color(0xFF334155), // Slate-700
    focusedBorderColor: const Color(0xFF60A5FA), // Blue-400
    hintStyle: const TextStyle(
      color: Color(0xFF94A3B8), // Slate-400 — lifted a step for contrast on glass
      fontSize: 14,
    ),
  );
}