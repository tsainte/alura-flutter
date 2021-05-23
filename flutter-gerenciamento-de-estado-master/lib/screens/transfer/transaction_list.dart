import 'package:bytebank/models/transaction.dart';
import 'package:bytebank/models/transactions.dart';
import 'package:bytebank/screens/transfer/no_transactions.dart';
import 'package:bytebank/screens/transfer/transaction_form.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

const _appBarTitle = 'Transfers';

class TransactionList extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: Text(_appBarTitle)),
        body: Consumer<Transactions>(builder: (context, transfers, child) {
          if (transfers.transactions.isEmpty)
            return Center(child: NoTransactions());
          return ListView.builder(
              itemCount: transfers.transactions.length,
              itemBuilder: (context, indice) =>
                  TransactionItem(transfers.transactions[indice]));
        }),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => Navigator.push(context,
              MaterialPageRoute(builder: (context) => TransactionForm())),
        ),
      );
}

class TransactionItem extends StatelessWidget {
  final Transaction _transaction;

  TransactionItem(this._transaction);

  @override
  Widget build(BuildContext context) => Card(
        child: ListTile(
          leading: Icon(Icons.monetization_on),
          title: Text(_transaction.value.toString()),
          subtitle: Text(_transaction.accountNumber.toString()),
        ),
      );
}
