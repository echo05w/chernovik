import 'package:final_app/data/constants.dart';
import 'package:final_app/data/notifiers.dart';
import 'package:final_app/views/pages/home_page.dart';
import 'package:final_app/views/pages/settings_page.dart';
import 'package:final_app/views/widgets/navbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'pages/profile_page.dart';

List<Widget> pages = [HomePage(), ProfilePage()];

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
              onPressed: () async{
                isDarkModeNotifier.value = !isDarkModeNotifier.value;
                final SharedPreferences prefs = 
                await SharedPreferences.getInstance();
                await prefs.setBool(Kconstants.themeModeKey, isDarkModeNotifier.value);
              },
              icon: ValueListenableBuilder(
                valueListenable: isDarkModeNotifier,
                builder: (context, isDarkMode, child) {
                  return Icon(isDarkMode ? Icons.dark_mode : Icons.light_mode);
                },
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsPageState()));
              },
              icon:  Icon(Icons.settings),
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
