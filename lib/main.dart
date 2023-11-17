import 'package:flutter/material.dart';
import 'package:kick/Screens/Splash.dart';
import 'package:kick/Screens/mScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mai_me',
      home: mScreen(),
    );
  }
}
