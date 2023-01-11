import 'package:flutter/material.dart';

enum AppTheme {
  lightTheme,
  darkTheme,
}

class AppThemes {
  // final Map<int, Color> tuu = {
  //   700: Color.fromARGB(255, 1, 174, 197),
  // };
  // final MaterialColor _tuuswatch =
  //     MaterialColor(Colors.yellow[700]!.value, tuu);
  static final appThemeData = {
    AppTheme.darkTheme: ThemeData(
      primarySwatch: Colors.grey,
      primaryColor: Colors.black,
      brightness: Brightness.dark,
      backgroundColor: const Color(0xFF212121),
      dividerColor: Colors.black54,
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Colors.white,
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all(Colors.white),
        ),
      ),
      textTheme: const TextTheme(
        subtitle1: TextStyle(color: Colors.white),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.grey, unselectedItemColor: Colors.white),
    ),

    //
    //

    AppTheme.lightTheme: ThemeData(
      // primarySwatch: MaterialColor(Colors.yellow[700]!.value, tuu),
      primarySwatch: Colors.blue,
      primaryColor: Colors.blue.shade300,
      // primaryColor: Color.fromARGB(255, 1, 174, 197),
      // primaryColor: Colors.white,
      brightness: Brightness.light,
      backgroundColor: const Color(0xFFE5E5E5),
      dividerColor: const Color(0xff757575),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Colors.blue,
        // backgroundColor: Color.fromARGB(255, 1, 174, 197),
        // backgroundColor: Colors.black,
        foregroundColor: Color.fromARGB(228, 255, 237, 45),
        // foregroundColor: Colors.white,
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all(Colors.black),
        ),
      ),
      textTheme: const TextTheme(
        subtitle1: TextStyle(color: Colors.black),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.blue,
        // backgroundColor: Color.fromARGB(255, 1, 174, 197),
        // backgroundColor: Colors.grey,
        selectedItemColor: Color.fromARGB(228, 255, 237, 45),
        // selectedItemColor: Colors.black,
        unselectedItemColor: Colors.white,
        // unselectedItemColor: Color.fromARGB(228, 255, 237, 45),
        // unselectedItemColor: Colors.white,
      ),
    ),
  };
}
