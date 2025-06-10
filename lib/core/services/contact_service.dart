import 'package:flutter_contacts/flutter_contacts.dart';

class ContactService {
  bool isPermissionGranted = false;

  Future<void> requestContactPermission() async {
    isPermissionGranted = await FlutterContacts.requestPermission(
      readonly: true,
    );
  }

  Future<List<Contact>> getAllContacts() async {
    List<Contact> contacts = [];
    
    if (isPermissionGranted) {
      contacts = await FlutterContacts.getContacts(withProperties: true);
    }else{
      await requestContactPermission();
      contacts = await FlutterContacts.getContacts(withProperties: true);
    }

    return contacts;
  }
}
