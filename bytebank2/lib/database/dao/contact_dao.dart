import 'package:bytebank2/models/contact.dart';

import '../database_manager.dart';

class ContactDao {
  static const _tableName = "contacts";
  static const _id = "id";
  static const _name = "name";
  static const _accountNumber = "account_number";

  static const _createContactsTable = "CREATE TABLE $_tableName"
      "($_id INTEGER PRIMARY KEY, "
      "$_name TEXT, "
      "$_accountNumber INTEGER)";

  // Futures with .then
  Future<List<Contact>> findAllWithThens() {
    return DatabaseManager().getDatabase(_createContactsTable).then((database) {
      return database.query(_tableName).then((contactsMapList) {
        return _toList(contactsMapList);
      });
    });
  }

  // futures with async / await
  Future<List<Contact>> findAll() async {
    final database = await DatabaseManager().getDatabase(_createContactsTable);
    final contactsMapList = await database.query(_tableName);
    return _toList(contactsMapList);
  }

  List<Contact> _toList(List<Map<String, dynamic>> mapList) {
    final contacts = mapList.map(
      (contactsMap) => Contact(
        contactsMap[_id],
        contactsMap[_name],
        contactsMap[_accountNumber],
      ),
    );
    return contacts.toList();
  }

  Future<int> save(Contact contact) async {
    final database = await DatabaseManager().getDatabase(_createContactsTable);
    return database.insert(_tableName, _toMap(contact));
  }

  Map _toMap(Contact contact) {
    final Map<String, dynamic> row = Map();
    row[_name] = contact.name;
    row[_accountNumber] = contact.accountNumber;

    return row;
  }
}
