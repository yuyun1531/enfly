import 'package:enfly/theme/ui_theme.dart';
import 'package:flutter/material.dart';

enum ThemeType { solemn, brisk, bright, fantasy }

class DefTheme {
  static ThemeType themeTypeFromString(String str) {
    return ThemeType.values
        .firstWhere((e) => e.toString() == str, orElse: () => ThemeType.brisk);
  }

  static final Map<ThemeType, UITheme> defaultTheme = {
    ThemeType.solemn: const UITheme(
      primaryColor: Color(0xFF00449E),
      lightPrimaryColor: Color(0xFF3371CD),
    ),
    ThemeType.brisk: const UITheme(
      primaryColor: Color(0xFF147AFF),
      lightPrimaryColor: Color(0xFFC0E1FF),
    ),
    ThemeType.bright: const UITheme(
      primaryColor: Color(0xFFF38787),
      lightPrimaryColor: Color(0xFFFAE1B6),
    ),
    ThemeType.fantasy: const UITheme(
      primaryColor: Color(0xFF8783F0),
      lightPrimaryColor: Color(0xFFAEB6F4),
    ),
  };

  static final Map<ThemeType, String> defaultThemeName = {
    ThemeType.solemn: const Text("深沉").toString(),
    ThemeType.brisk: const Text("轻快").toString(),
    ThemeType.bright: const Text("明媚").toString(),
    ThemeType.fantasy: const Text("梦幻").toString()
  };
}
