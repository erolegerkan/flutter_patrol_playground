import 'package:flutter/material.dart';
import 'package:patrol_test/auth_screen.dart';
import 'package:patrol_test/contacts_screen.dart';
import 'package:patrol_test/explore_screen.dart';
import 'package:patrol_test/finish_screen.dart';
import 'package:patrol_test/home_screen.dart';
import 'package:patrol_test/last_screen.dart';
import 'package:patrol_test/scroll_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Patrol',
      debugShowCheckedModeBanner: false,
      routes: {
        "/" : (context) => AuthScreen(),
        "/home" : (context) => HomeScreen(),
        "/explore" : (context) => ExploreScreen(),
        "/scroll" : (context) => ScrollScreen(),
        "/last" : (context) => LastScreen(),
        "/contacts" : (context) => ContactsScreen(),
        "/finish" : (context) => FinishScreen(),
      },
      initialRoute: "/",
    );
  }
}
