import 'package:final_app/data/notifiers.dart';
import 'package:final_app/views/widget_tree.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}
//? stateless
//! statefull
//? scaffold

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
          home: WidgetTree(),
        );
      },
    );
  }
}
