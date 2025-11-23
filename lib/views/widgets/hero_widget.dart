import 'package:flutter/material.dart';

class HeroWidget extends StatelessWidget {
  const HeroWidget({
    super.key,
    required this.title,
    this.nextPage,
  });

final String title;
final Widget? nextPage;

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: (){
        if (nextPage != null) {
          Navigator.push(
            context,
            MaterialPageRoute(builder:(context){return nextPage!;},),
          );
        }
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          Hero(
            tag: 'hero1',
            child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        'assets/images/uzbMain.jpg',
                       ),
                    ),
          ),
          FittedBox(
            child: Text(
              title,
               style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 70,
                letterSpacing: 50.0,
                color: Colors.white60,
               ),),
          ),
        ],
      ),
    );
  }
}