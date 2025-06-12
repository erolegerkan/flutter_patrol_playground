import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';

void main() {
  patrolTest("Add a new contact with Patrol", ($) async {
    await $.native.pressHome();
    await $.native.pressRecentApps();
    await $.native.swipe(from: Offset(0.4, 0.4), to: Offset(0.1, 0.1));
    await $.native.pressHome();
    await $.native.tap(Selector(contentDescription: 'Phone'));
    await Future.delayed(Duration(seconds: 2));
    await $.native.tap(
      Selector(resourceId: 'com.google.android.dialer:id/dialpad_fab'),
    );
    await Future.delayed(Duration(seconds: 1));
    await $.native.tap(Selector(text: '1'));
    await $.native.tap(Selector(text: '2'));
    await Future.delayed(Duration(seconds: 1));
    await $.native.tap(Selector(text: 'Create new contact'));
    await $.native.enterText(
      Selector(text: 'First name'),
      text: "Patrol Test",
      timeout: Duration(seconds: 2),
    );
    await $.native.tap(Selector(text: "Save"));
    await Future.delayed(Duration(seconds: 1));
  });
}
