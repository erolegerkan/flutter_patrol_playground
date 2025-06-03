import 'package:flutter/material.dart';

class ScrollScreen extends StatefulWidget {
  const ScrollScreen({super.key});

  @override
  State<ScrollScreen> createState() => _ScrollScreenState();
}

class _ScrollScreenState extends State<ScrollScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Explore Patrol")),
      body: ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              if (index == 16) {
                showDialog(
                  context: context,
                  builder:
                      (_) => AlertDialog(
                        title: Text("Well done, click \"Yes\" to continue!"),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, "/last");
                            },
                            child: Text(
                              "Yes",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.blue,
                              ),
                            ),
                          ),
                        ],
                      ),
                );
              }
            },
            child: Container(
              height: 100,
              padding: EdgeInsets.all(8),
              margin: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: index == 16 ? Colors.blue : Colors.black,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  Text(
                    index == 16 ? "Finally, you found me.\nClick here!" : "Learn Patrol ${index + 1}",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  const Spacer(),
                  if (index < 16)
                    Icon(
                      Icons.arrow_circle_down,
                      size: 50,
                      color: Colors.white,
                    ),
                  if (index == 16)
                    Icon(Icons.flutter_dash, size: 50, color: Colors.white),
                  if (index > 16)
                    Icon(
                      Icons.arrow_circle_up_outlined,
                      size: 50,
                      color: Colors.white,
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
