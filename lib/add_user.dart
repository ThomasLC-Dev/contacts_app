import 'package:contacts_app/model/user_list.dart';
import 'package:flutter/material.dart';

class AddUser extends StatelessWidget {
  final List<ContactList> contactList;
  const AddUser({required this.contactList, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Scores")),
      body: SafeArea(
        child: ListView.builder(
          itemCount: contactList.length,
          itemBuilder: (context, index) {
            final ContactList contact = contactList[index];
            return ListTile(
              title: Text(contact.firstName));
              // subtitle: Text("${contact.score} points"),
              // leading: const Icon(Icons.person),
              // trailing: const Icon(Icons.score));
          },
        ),
      ),
    );
  }
}