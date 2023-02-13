import 'package:contacts_app/db/contact-dao.dart';
import 'package:contacts_app/db/contact-db.dart';
import 'package:contacts_app/models/contact.dart';

class ContactData{
  Future<ContactDAO> get _contactDao async{
    final database = await $FloorContactDatabase.databaseBuilder('contact_database.db').build();

    return database.contactDao;
  }

  Future<List<Contact>> getAllContacts() async{
    final contactDao = await _contactDao;
    return contactDao.findAll();
  }

  Future<Contact?> getContactById(int id) async{
    final contactDao = await _contactDao;
    return contactDao.findById(id);
  }

  Future<void> createContact(Contact contact) async{
    final contactDao = await _contactDao;
    return contactDao.createContact(contact);
  }

  Future<void> updateContact(Contact contact) async {
    final contactDao = await _contactDao;
    return contactDao.updateContact(contact);
  }

  Future<void> deleteContact(int id) async {
    final contactDao = await _contactDao;
    return contactDao.deleteContact(id);
  }
}