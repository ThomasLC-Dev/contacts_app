import 'package:contacts_app/models/contact.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatefulWidget{
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home>{
  List<Contact> contacts = [
    Contact("Prénom", "Nom", "0606060606"),
    Contact("Prénom", "Nom", "0606060606"),
    Contact("Prénom", "Nom", "0606060606"),
    Contact("Nom", "Prénom", "0606060606"),
    Contact("Nom", "Prénom", "0606060606"),
    Contact("Nom", "Prénom", "0606060606"),
    Contact("Nom", "Prénom", "0606060606"),
    Contact("Nom", "Prénom", "0606060606"),
    Contact("Nom", "Prénom", "0606060606"),
    Contact("Nom", "Prénom", "0606060606"),
    Contact("Nom", "Prénom", "0606060606"),
    Contact("Nom", "Prénom", "0606060606"),
    Contact("Nom", "Prénom", "0606060606"),
    Contact("Nom", "Prénom", "0606060606"),
    Contact("Nom", "Prénom", "0606060606"),
    Contact("Nom", "Prénom", "0606060606"),
    Contact("Nom", "Prénom", "0606060606"),
    Contact("Nom", "Prénom", "0606060606"),
    Contact("Nom", "Prénom", "0606060606"),
    Contact("Nom", "Prénom", "0606060606"),
    Contact("Nom", "Prénom", "0606060606"),
    Contact("Nom", "Prénom", "0606060606"),
    Contact("Nom", "Prénom", "0606060606"),
    Contact("Nom", "Prénom", "0606060606"),
    Contact("Nom", "Prénom", "0606060606"),
    Contact("Nom", "Prénom", "0606060606"),
    Contact("Nom", "Prénom", "0606060606"),
    Contact("Nom", "Prénom", "0606060606"),
    Contact("Nom", "Prénom", "0606060606"),
  ];

  Widget generateContactList(BuildContext context, int index){
    return Card(
      child: ListTile(
        leading: const CircleAvatar(
          radius: 30,
          backgroundImage: NetworkImage(
            "https://i.picsum.photos/id/9/250/250.jpg?hmac=tqDH5wEWHDN76mBIWEPzg1in6egMl49qZeguSaH9_VI",
          ),
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
              onPressed: () => {
                Navigator.of(context)
                  .push(
                    MaterialPageRoute(
                      builder: (context) => const MyForm()
                  )
                )
              },
            ),
            FloatingActionButton(
              backgroundColor: Colors.green,
              child: const Icon(Icons.phone, size: 40),
              onPressed: _launchURL,
            ),
          ],
        )
      ),
    );
  }

  void _calling() {
    _launchURL();
  }

  _launchURL() async {
    const url = 'tel:+0606060606';
    if (await canLaunch(url)) {
      await launch(url);
    }
    else {
      throw 'Could not launch $url';
      print("Impossible de passer l'appel");
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(),
        body: ListView.builder(
            itemCount: contacts.length,
            itemBuilder: generateContactList
          ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add, size: 40),
          onPressed: () => {
            Navigator.of(context)
              .push(
                MaterialPageRoute(
                  builder: (context) => const MyForm()
              )
            )
          },
        ),
      )
    );
  }
}

class MyForm extends StatefulWidget {
  const MyForm({super.key});

  @override
  MyFormState createState() {
    return MyFormState();
  }
}

class MyFormState extends State<MyForm> {
  final _formKey = GlobalKey<FormState>();

    _createContact() {
      print("Contact créé.");
    }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ajouter un contact')),
      body: Column(children: [
        Form(child: 
        //key: _formKey,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            TextFormField(
              maxLength: 25,
              decoration: const InputDecoration(
                labelText: 'Nom',
                hintText: 'Entrez le nom du contact',
                border: OutlineInputBorder()),
            ),
            TextFormField(
              maxLength: 25,
              decoration: const InputDecoration(
                labelText: 'Prénom',
                hintText: 'Entrez le prénom du contact',
                border: OutlineInputBorder()),
            ),
            TextFormField(
              maxLength: 10,
              decoration: const InputDecoration(
                labelText: 'Numéro de téléphone',
                hintText: 'Entrez le numéro de téléphone du contact',
                border: OutlineInputBorder()),
            )
          ]),
        ),
        Row(children: [
          ElevatedButton(
            onPressed: _createContact(),
            child: const Text('Valider'),
          ),
          ElevatedButton(
            onPressed: () => {
            Navigator.of(context)
              .push(
                MaterialPageRoute(
                  builder: (context) => const Home()
                )
              )
            },
            child: const Text('Annuler'),
          ),
        ])
      ]),
    );
  }
}