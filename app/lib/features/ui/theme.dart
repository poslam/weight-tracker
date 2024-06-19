import 'package:flutter/material.dart';

class AppTheme extends ThemeExtension<AppTheme> {
  final Color background;
  final Color line;
  final Color control;
  final Color text;

  final double borderRadiusSmall = 8.0;
  final double borderRadiusMedium = 16.0;
  final double borderRadiusLarge = 24.0;

  final double paddingSmall = 8.0;
  final double paddingMedium = 16.0;
  final double paddingLarge = 24.0;

  AppTheme({
    required this.background,
    required this.line,
    required this.control,
    required this.text,
  });

  @override
  ThemeExtension<AppTheme> copyWith() {
    return this;
  }

  @override
  ThemeExtension<AppTheme> lerp(
    covariant ThemeExtension<AppTheme>? other,
    double t,
  ) {
    return this;
  }
}

extension AppThemeGetter on BuildContext {
  AppTheme get appTheme {
    return Theme.of(this).extension<AppTheme>()!;
  }
}
