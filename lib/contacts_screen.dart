import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:patrol_test/core/common/custom_button.dart';
import 'package:patrol_test/core/common/custom_text.dart';
import 'package:patrol_test/core/services/contact_service.dart';

class ContactsScreen extends StatefulWidget {
  const ContactsScreen({super.key});

  @override
  State<ContactsScreen> createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {
  bool isChallengeAccepted = false;
  List<Contact> contacts = [];
  bool isContactsEmpty = false;

  Widget _contactListsWidget() {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        spacing: 20,
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(8),
            ),
            child: TextButton(
              onPressed: () async {
                contacts = await ContactService().getAllContacts();
                if (contacts.isEmpty) {
                  setState(() {
                    isContactsEmpty = true;
                  });
                }
              },
              child: Text(
                "Fetch all the contacts",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          if (isContactsEmpty)
            Center(
              child: Text(
                "No contacts found\nFirst add a new contact!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          if (!isContactsEmpty)
            Expanded(
              child: ListView.builder(
                itemCount: contacts.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(contacts[index].name.first),
                    subtitle: Text(contacts[index].phones.first.number),
                  );
                },
              ),
            ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Contacts")),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment:
                isChallengeAccepted
                    ? MainAxisAlignment.start
                    : MainAxisAlignment.center,
            spacing: 16,
            children: [
              if (!isChallengeAccepted)
                CustomText(text: "Welcome to the last challenge my friend!"),
              if (!isChallengeAccepted)
                CustomText(
                  text: "Click the below button to take the challenge!",
                ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextButton(
                  onPressed: () {
                    if (!isChallengeAccepted) {
                      setState(() {
                        isChallengeAccepted = true;
                      });
                    }
                  },
                  child: Text(
                    !isChallengeAccepted
                        ? "Take the challenge"
                        : "Challenge accepted!",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              if (isChallengeAccepted) _contactListsWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
