import 'package:bytebank/screens/dashboard/balance_card.dart';
import 'package:bytebank/screens/dashboard/recent_transactions.dart';
import 'package:bytebank/screens/deposit/deposit_form.dart';
import 'package:bytebank/screens/transfer/transaction_form.dart';
import 'package:bytebank/screens/transfer/transaction_list.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Bytebank")),
      body: Align(
        alignment: Alignment.topCenter,
        child: ListView(
          children: [
            Center(child: BalanceCard()),
            ButtonBar(
              alignment: MainAxisAlignment.center,
              children: [
                _makeButton(context, "Make Deposit", DepositForm()),
                _makeButton(context, "Make Transfer", TransactionForm())
              ],
            ),
            RecentTransactions(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child:
                  _makeButton(context, "See all transfers", TransactionList()),
            )
          ],
        ),
      ),
    );
  }

  ElevatedButton _makeButton(
          BuildContext context, String text, Widget nextPage) =>
      ElevatedButton(
        onPressed: () => _push(context, nextPage),
        child: Text(text),
        style: ElevatedButton.styleFrom(primary: Colors.green),
      );

  _push(BuildContext context, Widget nextPage) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => nextPage),
    );
  }
}
