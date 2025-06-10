import 'package:flutter/material.dart';

class FinishScreen extends StatelessWidget {
  const FinishScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 16,
          children: [
            Icon(Icons.flutter_dash, size: 100, color: Colors.blue),
            Text("Well done, you finished the challenge!"),
            Text("See you soon, my friend!"),
          ],
        ),
      ),
    );
  }
}
