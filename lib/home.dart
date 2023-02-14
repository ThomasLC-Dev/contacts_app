import 'dart:developer';

import 'package:contacts_app/add-contact.dart';
import 'package:contacts_app/db/contact-data.dart';
import 'package:contacts_app/details-contact.dart';
import 'package:contacts_app/models/contact.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatefulWidget{
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home>{
  var contactData = ContactData();

  List<Contact> contacts = [];

  _navigateToAddContactPage(context){
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const AddContact()));
  }

  _navigateToDetailsContactPage(context, int id){
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => DetailsContact(contactId: id)));
  }

  Widget generateContactList(BuildContext context, int index){
    return Card(
      child: ListTile(
        leading: const CircleAvatar(
          radius: 30,
          backgroundImage: AssetImage('assets/user.png'),
        ),
        contentPadding: const EdgeInsets.all(10),
        title: Text(
          "${contacts[index].firstname} ${contacts[index].lastname}",
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold
          ),
        ),
        subtitle: Text(
          contacts[index].number,
          style: const TextStyle(
            fontSize: 18
          ),
        ),
        trailing: Wrap(
          spacing: 10,
          children: [
            FloatingActionButton(
              child: const Icon(Icons.manage_accounts, size: 40),
              onPressed: () => _navigateToDetailsContactPage(context, contacts[index].id!),
            ),
            FloatingActionButton(
              backgroundColor: Colors.green,
              onPressed: () async {
                launchUrl(Uri.parse('tel://${contacts[index].number}'));
              },
              child: const Icon(Icons.phone, size: 40),
            ),
          ],
        )
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Rechercher un contact'),
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: MySearchDelegate(contacts),
                );
              },
            )
          ]
        ),
        body: FutureBuilder(
          future: contactData.getAllContacts(),
          builder: (context, snapshot){
            if(snapshot.hasData && snapshot.data!.isNotEmpty){
              contacts = snapshot.data!;
              return ListView.builder(itemCount: contacts.length, itemBuilder: generateContactList);
            }
            else{
              return const Center(
                child: Text("Aucun contact"),
              );
            }
          },
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add, size: 40),
          onPressed: () => _navigateToAddContactPage(context),
        ),
      )
    );
  }
}

class MySearchDelegate extends SearchDelegate {
  final List<Contact> contacts;
  late List<Contact> filteredContacts;

  MySearchDelegate(this.contacts);

  _navigateToDetailsContactPage(context, int id){
    close(context, null);
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => DetailsContact(contactId: id)));
  }

  Widget generateFilteredContactList(BuildContext context, int index){
    return Card(
      child: ListTile(
        leading: const CircleAvatar(
          radius: 30,
          backgroundImage: AssetImage('assets/user.png'),
        ),
        contentPadding: const EdgeInsets.all(10),
        title: Text(
          "${filteredContacts[index].firstname} ${filteredContacts[index].lastname}",
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold
          ),
        ),
        subtitle: Text(
          filteredContacts[index].number,
          style: const TextStyle(
            fontSize: 18
          ),
        ),
        trailing: Wrap(
          spacing: 10,
          children: [
            FloatingActionButton(
              child: const Icon(Icons.manage_accounts, size: 40),
              onPressed: () => _navigateToDetailsContactPage(context, contacts[index].id!),
            ),
            FloatingActionButton(
              backgroundColor: Colors.green,
              onPressed: () async {
                launchUrl(Uri.parse('tel://${filteredContacts[index].number}'));
              },
              child: const Icon(Icons.phone, size: 40),
            ),
          ],
        )
      ),
    );
  }

  @override
  Widget? buildLeading(BuildContext context) => IconButton(
    icon: const Icon(Icons.arrow_back),
    onPressed: () => close(context, null),
  );
  
  @override
  List<Widget>? buildActions(BuildContext context) => [
    IconButton(
      icon: const Icon(Icons.clear),
      onPressed: () {
        query = '';
      },
    )
  ];
  
  @override
  Widget buildResults(BuildContext context){
    filteredContacts = contacts.where((contact) => (contact.firstname.toLowerCase().contains(query.toLowerCase()) || contact.lastname.toLowerCase().contains(query.toLowerCase()))).toList();
    return ListView.builder(itemCount: filteredContacts.length, itemBuilder: generateFilteredContactList);
  }
  
  @override
  Widget buildSuggestions(BuildContext context){
    filteredContacts = contacts;
    return ListView.builder(itemCount: filteredContacts.length, itemBuilder: generateFilteredContactList);
  }
}