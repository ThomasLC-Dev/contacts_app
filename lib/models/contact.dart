import 'package:floor/floor.dart';

@entity
class Contact{
  @PrimaryKey(autoGenerate: true)
  int? id;
  String lastname;
  String firstname;
  String number;

  Contact(this.id, this.lastname, this.firstname, this.number);
}