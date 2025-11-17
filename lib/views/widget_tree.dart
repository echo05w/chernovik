import 'package:final_app/views/home_page.dart';
import 'package:final_app/views/profille_page.dart';
import 'package:final_app/widgets/navbar_widget.dart';
import 'package:flutter/material.dart';

List<Widget> pages = [
  HomePage(),
  ProfillePage(),
];
class WidgetTree extends StatelessWidget {
  const WidgetTree({super.key});
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
    child: Scaffold(
      appBar: AppBar(
        title: Text("My First Flutter App"),
        centerTitle: true,
      ),
      body: pages.elementAt(1),
      bottomNavigationBar: NavbarWidget(),
    ),
  );
  }
}