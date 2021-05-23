import 'package:flutter/material.dart';

class NoTransactions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(32),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          "You've got no transactions to show 😅",
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
