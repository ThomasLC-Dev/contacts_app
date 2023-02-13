import 'dart:developer';

import 'package:contacts_app/db/contact-data.dart';
import 'package:contacts_app/home.dart';
import 'package:contacts_app/models/contact.dart';
import 'package:flutter/material.dart';

class DetailsContact extends StatefulWidget {
  final int contactId;
  const DetailsContact({super.key, required this.contactId});

  @override
  DetailsContactState createState() {
    return DetailsContactState();
  }
}

class DetailsContactState extends State<DetailsContact> {
  var contactData = ContactData();
  final lastnameController = TextEditingController();
  final firstnameController = TextEditingController();
  final numberController = TextEditingController();

  _navigateToHomePage(context) {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Home()));
  }

  _updateContact(context) {
    if(lastnameController.text != "" && firstnameController.text != "" && numberController.text != ""){
      Contact contact = Contact(widget.contactId, lastnameController.text, firstnameController.text, numberController.text);
      contactData.updateContact(contact);
      _navigateToHomePage(context);
    }
  }

  _deleteContact(context){
    contactData.deleteContact(widget.contactId);
    _navigateToHomePage(context);
  }

  _updateField(Contact contact){
    lastnameController.text = contact.lastname;
    firstnameController.text = contact.firstname;
    numberController.text = contact.number;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ajouter/Modifier un contact')),
      body: Column(children: [
        FutureBuilder(
          future: contactData.getContactById(widget.contactId),
          builder: (context, snapshot){
            if(snapshot.hasData && snapshot.data != null){
              _updateField(snapshot.data!);
              return Form(
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
              );
            }
            else{
              return const Center(
                child: Text("Erreur lors du chargement"),
              );
            }
          },
        ),
        Row(children: [
          ElevatedButton(
            onPressed: () => _updateContact(context),
            child: const Text('Valider'),
          ),
          ElevatedButton(
            onPressed: () => _navigateToHomePage(context),
            child: const Text('Annuler'),
          ),
          const Spacer(),
          ElevatedButton(
            onPressed: () => _deleteContact(context),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
            ),
            child: const Text('Supprimer le contact'),
          )
        ])
      ]),
    );
  }
}
