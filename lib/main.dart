import 'package:flutter/material.dart';
import 'screens/input.page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: InputPage(),
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0F1438),
        scaffoldBackgroundColor: Color(0xFF0F1438)
      )
    );
  }
}
