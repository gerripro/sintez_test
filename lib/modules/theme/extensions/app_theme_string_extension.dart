import 'package:sintez_test/modules/theme/enums/app_theme.dart';

extension AppThemeString on String {
  AppTheme get appThemeFromString {
    if (this == AppTheme.light.string) return AppTheme.light;
    if (this == AppTheme.dark.string) return AppTheme.dark;
    return AppTheme.light;
  }
}