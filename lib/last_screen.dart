import 'package:flutter/material.dart';
import 'package:patrol_test/core/common/custom_drawer.dart';

class LastScreen extends StatelessWidget {
  const LastScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Explore Patrol")),
      drawer: CustomDrawer(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.flutter_dash, size: 200, color: Colors.blue),
          Text(
            "Let's open the drawer from app bar together!",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
