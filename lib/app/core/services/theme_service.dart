import 'package:aventude_assignment/app/core/datamodels/base_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeService extends BaseModel {
  String? _darkMode;
  ThemeData? themeData;

  void initial() async {
    var _prefs = await SharedPreferences.getInstance();
    try {
      _darkMode = _prefs.getString("dark_mode");
      _darkMode ??= 'Yes';
    } catch (e) {
      if (kDebugMode) {
        print("User Not Found: $e");
      }
    }
  }

  ThemeData getTheme(String darkMode) {
    if (darkMode == 'Yes') {
      return _getDarkTheme();
    } else {
      return _getLightTheme();
    }
  }

  ThemeData _getDarkTheme() {
    if (kDebugMode) {
      print('dark theme');
    }

    ThemeData _themeData = ThemeData(
      brightness: Brightness.dark,
      primaryColor: const Color(0xFF050218),
      colorScheme: const ColorScheme.dark().copyWith(
        secondary: const Color(0xFF2C293C),
      ),
      //secondary: Color(0xFF2C293C),
      backgroundColor: const Color(0xFF050218),
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFF050218),
        titleTextStyle: TextStyle(
            fontSize: 18.0, fontWeight: FontWeight.w800, fontFamily: 'Avenir'),
      ),
      cardColor: const Color(0xFF2C293C),
      buttonTheme: ButtonThemeData(
        buttonColor: const Color(0xFFE8426D),
        colorScheme: const ColorScheme.light().copyWith(
          secondary: const Color(0xFFE8426D),
        ),
      ),
      //buttonColor: const Color(0xFFE8426D),
      fontFamily: 'Avenir',
      textTheme: const TextTheme(
        headline5: TextStyle(
            fontSize: 18.0, fontWeight: FontWeight.w800, fontFamily: 'Avenir'),
        headline6: TextStyle(fontSize: 16.0, fontStyle: FontStyle.italic),
        bodyText2: TextStyle(fontSize: 16.0, fontFamily: 'Avenir'),
        bodyText1: TextStyle(fontSize: 16.0, fontFamily: 'Avenir'),
        button: TextStyle(
            fontSize: 16.0, fontFamily: 'Avenir', fontWeight: FontWeight.w500),
        caption: TextStyle(fontSize: 16.0, fontFamily: 'Avenir'),
        headline4: TextStyle(
            fontSize: 16.0, fontFamily: 'Avenir', color: Color(0xFFC4C4C4)),
        // List Item Title Color
        headline3: TextStyle(fontSize: 16.0, fontFamily: 'Avenir'),
        headline2: TextStyle(fontSize: 16.0, fontFamily: 'Avenir'),
        headline1: TextStyle(fontSize: 16.0, fontFamily: 'Avenir'),
        overline: TextStyle(fontSize: 16.0, fontFamily: 'Avenir'),
        subtitle1: TextStyle(fontSize: 16.0, fontFamily: 'Avenir'),
        subtitle2: TextStyle(fontSize: 16.0, fontFamily: 'Avenir'),
      ),
    );

    return _themeData;
  }

  ThemeData _getLightTheme() {
    if (kDebugMode) {
      print('light theme');
    }

    ThemeData _themeData = ThemeData(
      brightness: Brightness.light,
      primaryColor: const Color(0xFF633AFD),
      //colorScheme.secondary: const Color(0xFF777777),
      colorScheme: const ColorScheme.light().copyWith(
        secondary: const Color(0xFF777777),
      ),
      backgroundColor: const Color(0xFFF4F2FD),
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFF633AFD),
        titleTextStyle: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w800,
            fontFamily: 'Avenir',
            color: Colors.white),
      ),
      cardColor: const Color(0xFFFFFFFF),
      buttonTheme: ButtonThemeData(
        buttonColor: const Color(0xFF3A179D),
        colorScheme: const ColorScheme.light().copyWith(
          secondary: const Color(0xFF3A179D),
        ),
      ),
      // buttonColor: const Color(0xFF3A179D),
      fontFamily: 'Avenir',
      textTheme: const TextTheme(
        headline5: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w800,
            fontFamily: 'Avenir',
            color: Colors.white),
        // AppBar
        headline6: TextStyle(fontSize: 16.0, fontStyle: FontStyle.italic),
        bodyText2: TextStyle(fontSize: 16.0, fontFamily: 'Avenir'),
        bodyText1: TextStyle(fontSize: 16.0, fontFamily: 'Avenir'),
        button: TextStyle(
            fontSize: 16.0,
            fontFamily: 'Avenir',
            fontWeight: FontWeight.w500,
            color: Colors.white),
        caption: TextStyle(fontSize: 16.0, fontFamily: 'Avenir'),
        headline4: TextStyle(
            fontSize: 16.0, fontFamily: 'Avenir', color: Color(0xFF5B7FE5)),
        // List Item Title Color
        headline3: TextStyle(fontSize: 16.0, fontFamily: 'Avenir'),
        headline2: TextStyle(fontSize: 16.0, fontFamily: 'Avenir'),
        headline1: TextStyle(fontSize: 16.0, fontFamily: 'Avenir'),
        overline: TextStyle(fontSize: 16.0, fontFamily: 'Avenir'),
        subtitle1: TextStyle(fontSize: 16.0, fontFamily: 'Avenir'),
        subtitle2: TextStyle(fontSize: 16.0, fontFamily: 'Avenir'),
      ),
    );

    return _themeData;
  }

  changeTheme() {
    _darkMode = _darkMode == 'Yes' ? 'No' : 'Yes';

    // Save to SharedPreferences
    try {
      SharedPreferences.getInstance().then((prefs) {
        prefs.setString("dark_mode", _darkMode!);
      });
    } catch (e) {
      if (kDebugMode) {
        print("User Not Found: $e");
      }
    }
  }
}
