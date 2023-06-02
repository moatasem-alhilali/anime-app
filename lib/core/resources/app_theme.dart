import 'package:flutter/material.dart';

final appDarkTheme = ThemeData(
  fontFamily: 'ios-1',
  appBarTheme: AppBarTheme(
    backgroundColor: ColorsManager.background,
    centerTitle: true,
  ),
  brightness: Brightness.dark,
  primaryColor: ColorsManager.primaryColor,
  scaffoldBackgroundColor: ColorsManager.background,
  

  backgroundColor: ColorsManager.background,
  progressIndicatorTheme:
      ProgressIndicatorThemeData(color: ColorsManager.primaryColor),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: ColorsManager.primaryColor,
  ),
  inputDecorationTheme: InputDecorationTheme(
    iconColor: ColorsManager.gray,
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: ColorsManager.primaryColor),
      borderRadius: BorderRadius.circular(8),
    ),
    border: OutlineInputBorder(
      borderSide: BorderSide(color: ColorsManager.white),
      borderRadius: BorderRadius.circular(8),
    ),
  ),
  //text theme
  textTheme: TextTheme(
    //title Theme
    titleLarge: TextStyle(
        fontSize: 25,
        color: ColorsManager.white,
        fontFamily: 'ios-2',
        overflow: TextOverflow.ellipsis),
    titleMedium: TextStyle(
        fontSize: 20,
        color: ColorsManager.white,
        fontFamily: 'ios-2',
        overflow: TextOverflow.ellipsis),
    titleSmall: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: ColorsManager.white,
        fontFamily: 'ios-1',
        overflow: TextOverflow.ellipsis),

    //head line Theme
    headlineSmall: TextStyle(
      fontSize: 14,
      color: ColorsManager.gray,
      overflow: TextOverflow.ellipsis,
      fontFamily: 'ios-1',
    ),
    headlineMedium: TextStyle(
        fontSize: 16,
        color: ColorsManager.gray,
        fontFamily: 'ios-1',
        overflow: TextOverflow.ellipsis),
    headlineLarge: TextStyle(
        fontSize: 20,
        color: ColorsManager.gray,
        fontFamily: 'ios-1',
        overflow: TextOverflow.ellipsis),
  ),
  //icon Theme
  iconTheme: IconThemeData(
    color: ColorsManager.white,
    size: 25,
  ),
);

class ColorsManager {
  static Color background = const Color(0xff181a20);
  static Color primaryColor = const Color(0xff06c149);
  static Color grayDark = const Color(0xff232327);
  static Color gray = Color.fromARGB(255, 194, 194, 194);
  static Color white = const Color.fromARGB(255, 255, 255, 255);
  static Color black = const Color.fromARGB(255, 0, 0, 0);
  static Color clr = const Color(0xff232530);

  // static Color green = const Color(0xffADED5C);
  // static Color yellow = const Color.fromARGB(255, 255, 162, 0);
}

TextStyle? titleLarge(context) {
  return Theme.of(context).textTheme.titleLarge;
}

TextStyle? titleMedium(context) {
  return Theme.of(context).textTheme.titleMedium;
}

TextStyle? titleSmall(context) {
  return Theme.of(context).textTheme.titleSmall;
}

TextStyle? headlineSmall(context) {
  return Theme.of(context).textTheme.headlineSmall;
}

TextStyle? headlineMedium(context) {
  return Theme.of(context).textTheme.headlineMedium;
}

TextStyle? headlineLarge(context) {
  return Theme.of(context).textTheme.headlineLarge;
}
