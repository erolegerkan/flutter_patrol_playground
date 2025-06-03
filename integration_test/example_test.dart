import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';
import 'package:patrol_test/main.dart';

void main() {
  patrolTest(
    'user signs in and shows the home screen',
    framePolicy: LiveTestWidgetsFlutterBindingFramePolicy.fullyLive,
    ($) async {
      await $.pumpWidgetAndSettle(MyApp());
      await $(TextField).enterText("@");
      await $(TextField).at(1).enterText("password");
      await Future.delayed(Duration(seconds: 2));
      await $(TextButton).tap();
      await Future.delayed(Duration(seconds: 3));
    },
  );
}