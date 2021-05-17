import 'package:bytebank2/screens/transactions_list.dart';
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
              Container(
                height: 120,
                child: ListView(scrollDirection: Axis.horizontal, children: [
                  _FeatureItem(
                    "Transfer",
                    Icons.monetization_on,
                    onTap: () => _navigateToContacts(context),
                  ),
                  _FeatureItem(
                    "Transaction feed",
                    Icons.description,
                    onTap: () => _navigateToTransactions(context),
                  ),
                ]),
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

  void _navigateToTransactions(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => TransactionsList()),
    );
  }
}

class _FeatureItem extends StatelessWidget {
  final String name;
  final IconData icon;
  final Function onTap;

  _FeatureItem(this.name, this.icon, {@required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(8.0),
        margin: EdgeInsets.only(right: 16.0),
        color: Theme.of(context).primaryColor,
        height: 100,
        width: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              icon,
              color: Colors.white,
              size: 32,
            ),
            Text(
              name,
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
