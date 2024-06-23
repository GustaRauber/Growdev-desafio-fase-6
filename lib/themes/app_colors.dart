import 'package:flutter/material.dart';

class AppColors extends ThemeExtension<AppColors> {
  final Color? primaryColor;
  final Color? combineWithPrimaryColor;

  AppColors({
    required this.primaryColor,
    required this.combineWithPrimaryColor,
  });
  @override
  AppColors copyWith({
    Color? primaryColor,
    Color? combineWithPrimaryColor,
  }) {
    return AppColors(
      primaryColor: primaryColor ?? this.primaryColor,
      combineWithPrimaryColor:
          combineWithPrimaryColor ?? this.combineWithPrimaryColor,
    );
  }

  @override
  ThemeExtension<AppColors> lerp(
      covariant ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) {
      return this;
    }
    return AppColors(
      primaryColor: Color.lerp(primaryColor, other.primaryColor, t),
      combineWithPrimaryColor:
          Color.lerp(combineWithPrimaryColor, other.combineWithPrimaryColor, t),
    );
  }
}
