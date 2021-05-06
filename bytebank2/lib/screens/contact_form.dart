import 'package:bytebank2/database/dao/contact_dao.dart';
import 'package:bytebank2/models/contact.dart';
import 'package:flutter/material.dart';

class ContactForm extends StatefulWidget {
  @override
  _ContactFormState createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _accountNumberController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New contact"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Wrap(
          runSpacing: 16,
          children: [
            TextField(
              decoration: InputDecoration(labelText: "Full Name"),
              controller: _nameController,
              style: TextStyle(fontSize: 20),
            ),
            TextField(
              decoration: InputDecoration(labelText: "Account number"),
              controller: _accountNumberController,
              keyboardType: TextInputType.number,
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => _create(context),
                child: Text("Create"),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _create(BuildContext context) {
    final name = _nameController.text;
    final accountNumber = int.tryParse(_accountNumberController.text);
    final contact = Contact(0, name, accountNumber);

    ContactDao()
        .save(contact)
        .then((_) => Future.delayed(Duration(seconds: 0)))
        .then((_) => Navigator.pop(context));
  }
}
