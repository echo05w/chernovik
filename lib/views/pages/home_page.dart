import 'package:final_app/data/constants.dart';
import 'package:final_app/views/widgets/hero_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              HeroWidget(title: 'Tour App',),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 10.0),
                child: Card(
                  child: Padding(
                    padding: EdgeInsets.all(20.00),
                     child:Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Text("Basic Layout", style:KTextStyle.titleTealText),
                         Text("Description of this", style:KTextStyle.descriptionTealText)
                       ],
                     )),
                   ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
