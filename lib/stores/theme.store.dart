import 'package:flutter/material.dart';

class ThemeStore {
  final themeMode = ValueNotifier(ThemeMode.system);

  void changeThemeMode(ThemeMode mode) => themeMode.value = mode;
}
