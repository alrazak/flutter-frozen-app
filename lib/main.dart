import 'package:flutter/material.dart';
import 'package:frozen_app/home_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Frozzz',
      theme: ThemeData(),
      home: HomeScreen(),
    );
  }
}
