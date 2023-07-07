
import 'package:flutter/material.dart';
import 'package:test_app/core/assets/colors/colors.dart';


abstract class AppTheme {
  static ThemeData theme() => ThemeData(
      scaffoldBackgroundColor: background,
      fontFamily: 'Manrope',
      backgroundColor: background,
      appBarTheme: const AppBarTheme(color: white),
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      textTheme: const TextTheme(
          displayLarge: headline1,
          displayMedium: headline2,
          displaySmall: headline3,
          headlineMedium: headline4,
          headlineSmall: headline5,
          titleLarge: headline6,
          bodyLarge: bodyText1,
          bodyMedium: bodyText2,
          titleMedium: subTitle1,
          titleSmall: subTitle2),
      colorScheme: const ColorScheme(
        background: background,
        brightness: Brightness.light,
        primary: blue,
        secondary: orange,
        error: red,
        surface: greenAccent,
        onPrimary: white,
        onSecondary: deepDark,
        onBackground: background,
        onError: primaryColor,
        onSurface: white,
      ));

  // Fonts
  static const headline1 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: mainDark,
  );
  static const headline2 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: white,
  );
  static const headline3 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w700,
    color: textGrey,
  );
  static const headline4 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: darkBlue,
  );
  static const headline5 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: secondaryColor,
  );
  static const headline6 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: green,
  );
  static const bodyText1 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: deepDark,
  );

  static const bodyText2 = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    color: icons,
  );

  static const subTitle1 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: red,
  );

  static const subTitle2 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: linkWater,
  );

  static const caption = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: lightBlue,
  );
}
