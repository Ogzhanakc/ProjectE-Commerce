import 'package:flutter/material.dart';
import 'package:project3/constants.dart';
//MaterialStateProperty kullanarak renk verme.
//backgroundColor: MaterialStateProperty.all(Colors.green),
//----------------------------------------------------LIGHT MODE----------
class MyTheme {
  ThemeData myThemeLight = ThemeData.light().copyWith(



    colorScheme: const ColorScheme(

      brightness: Brightness.light,
      primary: Colors.white,
      onPrimary: Colors.black,
      secondary: Colors.white,
      onSecondary: Colors.red,
      error: Colors.white,
      onError: Colors.orangeAccent,
      background: Colors.teal,
      onBackground: Colors.green,
      surface: Colors.blueGrey,
      onSurface: Colors.white,
    ),
    tabBarTheme: const TabBarTheme().copyWith(
        labelColor: mainColor,
        unselectedLabelColor: Colors.black,
        overlayColor: MaterialStateProperty.all(mainColor),
        labelPadding: const EdgeInsets.all(5),
        indicator: const UnderlineTabIndicator(
          borderSide: BorderSide(color: mainColor, width: 5),
        )),
  );
//---------------------------------------------------------------------
//-----------------------------DARK MODE------------------------------
  ThemeData myThemeDark = ThemeData.dark().copyWith(
      scaffoldBackgroundColor: Colors.blueGrey,

      colorScheme: const ColorScheme(

      brightness: Brightness.dark,
      primary: Colors.white,
      onPrimary: Colors.white,
      secondary: Colors.white,
      onSecondary: Colors.black,
      error: Colors.white,
      onError: Colors.orangeAccent,
      background: Colors.teal,
      onBackground: Colors.white,
      surface: Colors.blueGrey,
      onSurface: Colors.indigo,
    ),
  );
//--------------------------------------------------------------
  ThemeData buttonTheme = ThemeData().copyWith(
      colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: Colors.white,
          onPrimary: customYellow,
          secondary: customYellow,
          onSecondary: Colors.white,
          error: Colors.white,
          onError: Colors.white,
          background: Colors.white,
          onBackground: Colors.white,
          surface: Colors.white,
          onSurface: Colors.white));

  TextTheme textTheme = const TextTheme().copyWith(
      bodyText1:
          const TextStyle(color: customYellow, fontSize: 20.0, fontFamily: "Italic"),
      bodyText2: const TextStyle(
        color: Colors.white,
        fontSize: 20,
      ));




}





