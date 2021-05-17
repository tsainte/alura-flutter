import 'package:bytebank2/components/centered_message.dart';
import 'package:bytebank2/components/progress.dart';
import 'package:bytebank2/models/transaction.dart';
import 'package:bytebank2/network/webclients/transaction_webclient.dart';
import 'package:flutter/material.dart';

class TransactionsList extends StatefulWidget {
  @override
  _TransactionsListState createState() => _TransactionsListState();
}

class _TransactionsListState extends State<TransactionsList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transactions'),
      ),
      body: FutureBuilder(
        future: Future.delayed(Duration(seconds: 1))
            .then((value) => TransactionWebClient().findAll()),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              break;
            case ConnectionState.waiting:
              return Progress(
                message: "Fetching...",
              );
              break;
            case ConnectionState.active:
              // TODO: Handle this case.
              break;
            case ConnectionState.done:
              // check if returns something, ie, 200 OK
              if (snapshot.hasData) {
                final List<Transaction> transactions = snapshot.data;
                // check if has transactions
                if (transactions.isNotEmpty) {
                  return ListView.builder(
                    itemBuilder: (context, index) {
                      final Transaction transaction = transactions[index];
                      return Card(
                        child: ListTile(
                          leading: Icon(Icons.monetization_on),
                          title: Text(
                            transaction.value.toString(),
                            style: TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                            transaction.contact.accountNumber.toString(),
                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                      );
                    },
                    itemCount: transactions.length,
                  );
                }
              }
              break;
          }
          return CenteredMessage(
            "No transactions found",
            icon: Icons.warning,
          );
        },
      ),
    );
  }
}
