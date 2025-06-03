import 'package:flutter/material.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  bool isFirstButtonClicked = false;
  bool isSubmitButtonClicked = false;
  TextEditingController nameController = TextEditingController();

  Widget _renderBody() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.flutter_dash, size: 200, color: Colors.blue),
        Text(
          "Welcome friend ❤\nMy name is Flutty",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
        ),
        const SizedBox(height: 20),
        if (!isSubmitButtonClicked)
          Container(
            padding: EdgeInsets.all(8),
            margin: EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.black),
            ),
            child: TextField(
              controller: nameController,
              decoration: InputDecoration(
                hintText: "What is our friend\'s name?",
                border: OutlineInputBorder(),
              ),
            ),
          ),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(8),
          ),
          child: TextButton(
            onPressed: () {
              ScaffoldMessenger.of(context).clearSnackBars();
              if (nameController.text.toLowerCase() == "flutty") {
                setState(() {
                  isSubmitButtonClicked = true;
                });
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      "Oopsiee, try again!",
                      style: TextStyle(color: Colors.white),
                    ),
                    backgroundColor: Colors.red,
                  ),
                );
              }
            },
            child: Text(
              isSubmitButtonClicked ? "Correct, keep going!" : "Submit!",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: isSubmitButtonClicked ? Colors.blue : Colors.grey,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _renderLastPart() {
    return Column(
      children: [
        const SizedBox(height: 20),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(8),
          ),
          child: TextButton(
            onPressed: () {
              Navigator.pushNamed(context, "/scroll");
            },
            child: Text(
              "Let's test scrollability!",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Explore Patrol")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (!isFirstButtonClicked)
                Text(
                  "Click the button ->",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              const SizedBox(width: 20),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextButton(
                  onPressed:
                      () => setState(() {
                        isFirstButtonClicked = true;
                      }),
                  child: Text(
                    isFirstButtonClicked ? "Well done!" : "Start from here!",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: isFirstButtonClicked ? Colors.blue : Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
          if (isFirstButtonClicked) _renderBody(),
          if (isSubmitButtonClicked) _renderLastPart(),
        ],
      ),
    );
  }
}
