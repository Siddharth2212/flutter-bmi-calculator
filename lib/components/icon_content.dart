import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';

class IconContent extends StatelessWidget {

  IconContent({this.label, this.icon});

  final String label;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
      Icon(
        icon,
        size: 80
      ),
      SizedBox(
        height: 15.55
      ),
      Text(label, style: kLabelTextStyle)
    ],);
  }
}