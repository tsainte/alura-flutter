import 'package:bytebank/models/balance.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BalanceCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Consumer<Balance>(
          builder: (context, value, child) {
            return Text(
              value.toString(),
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 64),
            );
          },
        ),
      ),
    );
  }
}
