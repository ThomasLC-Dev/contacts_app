import 'package:contacts_app/models/contact.dart';
import 'package:floor/floor.dart';

@dao
abstract class ContactDAO{
  @Query("SELECT * FROM Contact")
  Future<List<Contact>> findAll();

  @Query("SELECT * FROM Contact WHERE id = :id")
  Future<Contact?> findById(int id);

  @insert
  Future<void> createContact(Contact contact);

  @update
  Future<void> updateContact(Contact contact);

  @Query("DELETE FROM Contact WHERE id = :id")
  Future<void> deleteContact(int id);
}