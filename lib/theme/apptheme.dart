import 'package:flutter/material.dart';

class AppTheme {
  // 定义主色调和次要色调
  static const Color primaryColor = Colors.blue;
  static const Color secondaryColor = Colors.green;

  // 定义字体大小
  static const double headline1Size = 32;
  static const double headline2Size = 24;
  static const double bodyText1Size = 16;
  static const double bodyText2Size = 14;

  // 定义文本主题
  static final TextTheme textTheme = TextTheme(
    headline1: TextStyle(
        fontSize: headline1Size,
        fontWeight: FontWeight.bold,
        color: primaryColor),
    headline2: TextStyle(
        fontSize: headline2Size,
        fontWeight: FontWeight.bold,
        color: primaryColor),
    bodyText1: TextStyle(fontSize: bodyText1Size, color: Colors.black),
    bodyText2: TextStyle(fontSize: bodyText2Size, color: Colors.black),
  );

  // 定义主题
  static final ThemeData themeData = ThemeData(
    primaryColor: primaryColor,
    hintColor: secondaryColor,
    textTheme: textTheme,
    appBarTheme: AppBarTheme(
      backgroundColor: primaryColor,
      textTheme: TextTheme(
        headline6: TextStyle(
            fontSize: headline2Size,
            fontWeight: FontWeight.bold,
            color: Colors.white),
      ),
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: primaryColor,
      textTheme: ButtonTextTheme.primary,
    ),
  );
}
