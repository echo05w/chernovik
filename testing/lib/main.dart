import 'package:flutter/material.dart';
import 'views/welcome_page.dart'; // or your first screen

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WelcomePage(),   // your app starts here
    );
  }
}
