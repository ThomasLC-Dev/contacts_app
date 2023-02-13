import 'package:contacts_app/db/contact-data.dart';
import 'package:contacts_app/home.dart';
import 'package:contacts_app/models/contact.dart';
import 'package:flutter/material.dart';

class AddContact extends StatefulWidget {
  const AddContact({super.key});

  @override
  AddContactState createState() {
    return AddContactState();
  }
}

class AddContactState extends State<AddContact> {
  var contactData = ContactData();
  final lastnameController = TextEditingController();
  final firstnameController = TextEditingController();
  final numberController = TextEditingController();

  _navigateToHomePage(context) {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Home()));
  }

  _addContact(context) {
    if(lastnameController.text != "" && firstnameController.text != "" && numberController.text != ""){
      Contact contact = Contact(null, lastnameController.text, firstnameController.text, numberController.text);
      contactData.createContact(contact);
      _navigateToHomePage(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ajouter un contact')),
      body: Column(children: [
        Form(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            TextFormField(
              maxLength: 25,
              decoration: const InputDecoration(
                  labelText: 'Nom',
                  hintText: 'Entrez le nom du contact',
                  border: OutlineInputBorder()),
              controller: lastnameController,
            ),
            TextFormField(
              maxLength: 25,
              decoration: const InputDecoration(
                  labelText: 'Prénom',
                  hintText: 'Entrez le prénom du contact',
                  border: OutlineInputBorder()),
              controller: firstnameController,
            ),
            TextFormField(
              maxLength: 10,
              decoration: const InputDecoration(
                  labelText: 'Numéro de téléphone',
                  hintText: 'Entrez le numéro de téléphone du contact',
                  border: OutlineInputBorder()),
              controller: numberController,
            )
          ]),
        ),
        Row(children: [
          ElevatedButton(
            onPressed: () => _addContact(context),
            child: const Text('Valider'),
          ),
          ElevatedButton(
            onPressed: () => _navigateToHomePage(context),
            child: const Text('Annuler'),
          ),
        ])
      ]),
    );
  }
}