import 'package:final_app/data/constants.dart';
import 'package:final_app/views/pages/course_page.dart';
import 'package:final_app/views/widgets/container_widget.dart';
import 'package:final_app/views/widgets/hero_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> list = [
      KValue.basicLayout,
      KValue.advancedLayout,
      KValue.settings,
      KValue.home,
      KValue.profile,
      KValue.about,
    ];
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 10.0),
              HeroWidget(title: 'Tour App', nextPage: CoursePage()),
              SizedBox(height: 10.0),
              ...List.generate(list.length, (index) {
                return ContainerWidget(
                  title: list.elementAt(index),
                  description: 'This is the description for item ${index + 1}.',
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
