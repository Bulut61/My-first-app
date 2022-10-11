import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._(); // leerer konstruktor

  static final Color _lightPrimaryColor = Color.fromRGBO(0, 105, 137, 0.8); //Colors.blueGrey.shade50; //#DDBEA9 könnte man probieren
  static final Color _lightPrimaryVariantColor = Color.fromRGBO(55, 71, 79, 1);
  static final Color _lightOnPrimaryColor = Color.fromRGBO(243, 231, 224, 1); //#F3E7E0
  static const Color _lightTextColorPrimary = Color.fromRGBO(244, 245, 246, 1); //#F4F5F6
  static const Color _appbarColorLight = Color.fromRGBO(70, 171, 153, 1); //Color.fromRGBO(248, 249, 145, 1); //#F8F991

  static final Color _darkPrimaryColor = Colors.blueGrey.shade900;
  static const Color _darkPrimaryVariantColor = Colors.black;
  static final Color _darkOnPrimaryColor = Colors.blueGrey.shade300;
  static const Color _darkTextColorPrimary = Colors.white;
  static final Color _appbarColorDark = Colors.blueGrey.shade800;

  static const Color _iconColor = Color.fromRGBO(247, 126, 92, 1);

  static final TextStyle _lightHeadingText = TextStyle(
    color: _lightTextColorPrimary,
    fontFamily: "Rubik",
    fontWeight: FontWeight.bold,
    fontSize: 22,
  );

  static final TextStyle _lightBodyText = TextStyle(color: _lightTextColorPrimary, fontFamily: "Rubik", fontStyle: FontStyle.italic);

  static final TextTheme _lightTextTheme = TextTheme(
    headline1: _lightHeadingText,
    bodyText1: _lightBodyText,
  );

  static final TextStyle _darkThemeHeadingTextStyle = _lightHeadingText.copyWith(color: _darkTextColorPrimary);

  static final TextStyle _darkThemeBodyeTextStyle = _lightBodyText.copyWith(color: _darkTextColorPrimary);

  static final TextTheme _darkTextTheme = TextTheme(
    headline1: _darkThemeHeadingTextStyle,
    bodyText1: _darkThemeBodyeTextStyle,
  );

  static final ThemeData lightTheme = ThemeData(
      scaffoldBackgroundColor: _lightOnPrimaryColor,
      appBarTheme: AppBarTheme(
        color: _appbarColorLight,
        iconTheme: IconThemeData(color: _iconColor),
      ),
      iconTheme: IconThemeData(color: _iconColor),
      bottomAppBarColor: _lightTextColorPrimary,
      bottomAppBarTheme: BottomAppBarTheme(color: _appbarColorLight),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: _appbarColorLight,
      ),
      colorScheme: ColorScheme.light(
        primary: _lightPrimaryColor,
        onPrimary: _lightOnPrimaryColor,
        primaryVariant: _lightPrimaryVariantColor,
      ),
      textTheme: _lightTextTheme);

  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: _darkOnPrimaryColor,
    appBarTheme: AppBarTheme(
      color: _appbarColorDark,
      iconTheme: IconThemeData(color: _iconColor),
    ),
    bottomAppBarColor: _appbarColorDark,
    colorScheme: ColorScheme.dark(
      primary: _darkPrimaryColor,
      onPrimary: _darkOnPrimaryColor,
      primaryVariant: _darkPrimaryVariantColor,
    ),
    textTheme: _darkTextTheme,
  );
}
