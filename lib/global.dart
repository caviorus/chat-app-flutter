import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// SharedPreferences get string 
Future<String> spGetString(String key) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString(key) ?? "";
}

// SharedPreferences set string 
Future<void> spSetString(String key, String value) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString(key, value);
}

class AppScreen {
  final BuildContext context;

  AppScreen(this.context);

  double get screenWidth => MediaQuery.of(context).size.width;
  double get screenHeight => MediaQuery.of(context).size.height;
}

class AppColor {
  static Color primary = const Color(0xFF6B4EFF);

  static Color black = const Color(0xFF0A121A);
  static Color white = Colors.white;
}

class AppRouter {
  Future<void> pushedIn(context, destination, {Duration duration = const Duration(seconds: 1)}) async {
    await Future.delayed(duration);

    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => destination));
  }
}
