import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    required this.text,
    this.fontSize = 25,
    this.color = Colors.blue,
  });

  final String text;
  final double fontSize;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
        color: Colors.blue,
      ),
      textAlign: TextAlign.center,
    );
  }
}
