import 'package:final_app/data/constants.dart';
import 'package:final_app/data/notifiers.dart';
import 'package:final_app/views/pages/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}
//? stateless
//! statefull
//? scaffold

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    initThemeMode();
    super.initState();
  }
  void initThemeMode()async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
   final bool? repeat = prefs.getBool(Kconstants.themeModeKey);
   isDarkModeNotifier.value = repeat?? false;
  }
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: isDarkModeNotifier,
      builder: (context, isDarkMode, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.teal,
              brightness: isDarkMode ? Brightness.dark : Brightness.light,
            ),
          ),
          home: WelcomePage(),
        );
      },
    );
  }
}
