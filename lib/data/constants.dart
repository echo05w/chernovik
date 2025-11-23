import 'package:flutter/material.dart';

class Kconstants{
  static const String themeModeKey = 'themeModeKey';
}

class KTextStyle {
  static TextStyle titleTealText= TextStyle(
    color: Colors.teal,
    fontSize: 18.0,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle descriptionTealText= TextStyle(
    fontSize: 16.0,
  );
}

class KValue{
  static const String basicLayout = 'Basic Layout';
  static const String advancedLayout = 'Advanced Layout';
  static const String settings = 'Settings';
  static const String home = 'Home';
  static const String profile = 'Profile';
  static const String about = 'About';
  static const String logout = 'Logout';
}