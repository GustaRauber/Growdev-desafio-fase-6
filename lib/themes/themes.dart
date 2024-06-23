import 'package:fase_6/themes/app_colors.dart';
import 'package:flutter/material.dart';

ThemeData darkTheme() {
  const primaryColor = Colors.green;
  return ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: const Color(0xFF121212),
    fontFamily: "Montserrat",
    appBarTheme: const AppBarTheme(
      color: Colors.black,
      actionsIconTheme: IconThemeData(
        size: 30,
      ),
    ),
    cardTheme: CardTheme(
      color: primaryColor.withOpacity(.5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
    dividerTheme: const DividerThemeData(
      color: Colors.white,
      thickness: 1,
    ),
    checkboxTheme: CheckboxThemeData(
      fillColor: MaterialStateProperty.all(primaryColor),
    ),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: primaryColor,
      selectionColor: primaryColor.withOpacity(.5),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: primaryColor,
      foregroundColor: Colors.white,
    ),
    textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
      foregroundColor: MaterialStateProperty.all(primaryColor),
      overlayColor: MaterialStateProperty.all(
        primaryColor.withOpacity(.1),
      ),
    )),
    extensions: [
      AppColors(
        primaryColor: primaryColor,
        combineWithPrimaryColor: Colors.blue,
      ),
    ],
  );
}

ThemeData lightTheme() {
  const primaryColor = Colors.green;
  return ThemeData(
    brightness: Brightness.light,
    primarySwatch: primaryColor,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: primaryColor,
      foregroundColor: Colors.white,
    ),
    appBarTheme: const AppBarTheme(
      actionsIconTheme: IconThemeData(
        size: 30,
      ),
    ),
    textTheme: const TextTheme(
      titleMedium: TextStyle(
        fontSize: 18,
      ),
      bodyMedium: TextStyle(
        fontSize: 16,
      ),
    ),
    dividerTheme: const DividerThemeData(
      color: Colors.black54,
      thickness: 1,
    ),
    extensions: [
      AppColors(
        primaryColor: primaryColor,
        combineWithPrimaryColor: Colors.blue,
      ),
    ],
  );
}
