import 'package:contacts_app/models/contact.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget{
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home>{
  List<Contact> contacts = [
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
            fontSize: 25,
            fontWeight: FontWeight.bold
          ),
        ),
        subtitle: Text(
          contacts[index].number,
          style: const TextStyle(
            fontSize: 18
          ),
        ),
      ),
    );
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
          // Navigator.of(context).push(MaterialPageRoute(
          //   builder: (context) => HallOfFame(resultList: _gameResults)));
          },
        ),
      )
    );
  }
}