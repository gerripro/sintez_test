
import 'package:flutter/material.dart';
import 'package:sintez_test/modules/theme/ui/theme_styles.dart';

enum AppTheme {
  light('light'),
  dark('dark');

  const AppTheme(this.string);

  final String string;

  ThemeData get theme {
    switch (this) {
      case AppTheme.light:
        return ThemeStyles.lightTheme;
      case AppTheme.dark:
        return ThemeStyles.darkTheme;
    }
  }
}