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
      await Future.delayed(Duration(seconds: 1));
      await $(TextButton).tap();
      await Future.delayed(Duration(seconds: 1));
      await $(TextButton).tap();
      await Future.delayed(Duration(seconds: 1));
      await $(TextButton).tap();
      await Future.delayed(Duration(seconds: 1));
      await $(TextButton).tap();
      await Future.delayed(Duration(seconds: 1));
      await $(TextField).enterText("flutty");
      await $(TextButton).at(1).tap();
      await Future.delayed(Duration(seconds: 1));
      await $(TextButton).at(2).tap();
      await Future.delayed(Duration(seconds: 1));
      await $("Finally, you found me.\nClick here!").scrollTo(
        scrollDirection: AxisDirection.down,
      );
      await $(Container).$(Row).$("Finally, you found me.\nClick here!").tap();
      await $(AlertDialog).$("Yes").tap();
      await Future.delayed(Duration(seconds: 1));
      await $(Icons.menu).tap();
      await Future.delayed(Duration(seconds: 1));
      await $(TextButton).tap();
      await Future.delayed(Duration(seconds: 1));
      await $(TextButton).tap();
      await Future.delayed(Duration(seconds: 1));
      await $(TextButton).tap();
      await Future.delayed(Duration(seconds: 1));
      await $(TextButton).at(1).tap();
      await Future.delayed(Duration(seconds: 1));
      if(await $.native.isPermissionDialogVisible()){
        await $.native.grantPermissionWhenInUse();
      }
      await Future.delayed(Duration(seconds: 1));
      await $("Fetch the contacts").tap();
      await $(Container).$(Icons.flutter_dash).tap();
      await Future.delayed(Duration(seconds: 3));
    },
  );
}
