import 'package:flutter/material.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 28, 40, 111),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            // decoration: ShapeDecoration(
            // shape: CircleBorder({BorderSide Side = Border.all(), eccentricity: 10.0},),),
            margin: EdgeInsets.all(15),
            child: Image.asset(
              "assets/logo.png",
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Text(
            "Mai_Me App",
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 95, 156, 208)),
          )
        ],
      ),
    );
  }
}
