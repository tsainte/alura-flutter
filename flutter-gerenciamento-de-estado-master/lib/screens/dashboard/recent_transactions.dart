import 'dart:math';

import 'package:bytebank/models/transactions.dart';
import 'package:bytebank/screens/transfer/no_transactions.dart';
import 'package:bytebank/screens/transfer/transaction_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RecentTransactions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Latest transactions",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        Consumer<Transactions>(builder: (context, transactions, child) {
          if (transactions.transactions.isEmpty) return NoTransactions();
          final recentTransactions =
              transactions.transactions.reversed.toList();
          return ListView.builder(
            itemBuilder: (context, index) {
              final transaction = recentTransactions[index];
              return TransactionItem(transaction);
            },
            shrinkWrap: true,
            itemCount: min(recentTransactions.length, 3),
          );
        }),
      ],
    );
  }
}
