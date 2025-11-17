import 'package:final_app/data/notifiers.dart';
import 'package:final_app/views/pages/home_page.dart';
import 'package:final_app/views/pages/profille_page.dart';
import 'package:final_app/views/widgets/navbar_widget.dart';
import 'package:flutter/material.dart';

List<Widget> pages = [HomePage(), ProfillePage()];

class WidgetTree extends StatelessWidget {
  const WidgetTree({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("My First Flutter App"),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                isDarkModeNotifier.value = !isDarkModeNotifier.value;
              },
              icon: ValueListenableBuilder(
                valueListenable: isDarkModeNotifier,
                builder: (context, isDarkMode, child) {
                  return Icon(isDarkMode ? Icons.dark_mode : Icons.light_mode);
                },
              ),
            ),
          ],
        ),
        body: ValueListenableBuilder(
          valueListenable: selePageNotifier,
          builder: (context, selectedPage, child) {
            return pages.elementAt(selectedPage);
          },
        ),
        bottomNavigationBar: NavbarWidget(),
      ),
    );
  }
}
