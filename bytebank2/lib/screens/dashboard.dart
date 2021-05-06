import 'package:flutter/material.dart';

import 'contacts_list.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset('images/bytebank_logo.png'),
              GestureDetector(
                onTap: () => _navigateToContacts(context),
                child: ContactsContainer(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _navigateToContacts(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ContactsList()),
    );
  }
}

class ContactsContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      color: Theme.of(context).primaryColor,
      height: 100,
      width: 150,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.people,
            color: Colors.white,
            size: 32,
          ),
          Text(
            "Contacts",
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ],
      ),
    );
  }
}
