import 'package:bytebank/components/editor.dart';
import 'package:bytebank/models/balance.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DepositForm extends StatelessWidget {
  final _amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Deposit")),
      body: Column(
        children: <Widget>[
          Editor(
            placeholder: "0.00",
            controller: _amountController,
            label: "Add money",
            icon: Icons.monetization_on,
          ),
          ElevatedButton(
            child: Text("Confirm"),
            style: ElevatedButton.styleFrom(primary: Colors.green),
            onPressed: () => _makeDeposit(context),
          ),
        ],
      ),
    );
  }

  _makeDeposit(BuildContext context) {
    final amount = double.tryParse(_amountController.text);
    if (amount != null) {
      Provider.of<Balance>(context, listen: false).add(amount);
      Navigator.of(context).pop();
    }
  }
}
