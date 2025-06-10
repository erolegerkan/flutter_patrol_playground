import 'package:flutter_contacts/flutter_contacts.dart';

class ContactService {
  Future<bool> getUserPermission() async {
    return await FlutterContacts.requestPermission();
  }

  Future<List<Contact>> getAllContacts() async {
    return await FlutterContacts.getContacts(withProperties: true);
  }
}
