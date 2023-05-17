import 'package:flutter/material.dart';
import 'package:restdful_api/examplwe_two.dart';
import 'package:restdful_api/home_screen.dart';
import 'package:restdful_api/three_example.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

      ),
      home: const ThreeExample(),

    );
  }
}

