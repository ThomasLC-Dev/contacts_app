import 'dart:async';
import 'package:contacts_app/db/contact-dao.dart';
import 'package:contacts_app/models/contact.dart';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'contact-db.g.dart'; // the generated code will be there

@Database(version: 1, entities: [Contact])
abstract class ContactDatabase extends FloorDatabase {
  ContactDAO get contactDao;
}
