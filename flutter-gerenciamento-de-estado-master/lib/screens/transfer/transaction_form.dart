import 'package:bytebank/components/editor.dart';
import 'package:bytebank/models/balance.dart';
import 'package:bytebank/models/transaction.dart';
import 'package:bytebank/models/transactions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

const _appBarTitle = 'Creating Transfer';

const _valueLabel = 'Value';
const _valuePlaceholder = '0.00';

const _accountNumberLabel = 'AccountNumber';
const _accountNumberPlaceholder = '0000';

const _confirmButton = 'Confirm';

class TransactionForm extends StatelessWidget {
  final TextEditingController _accountNumberController =
      TextEditingController();
  final TextEditingController _valueController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_appBarTitle),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Editor(
                controller: _accountNumberController,
                placeholder: _accountNumberPlaceholder,
                label: _accountNumberLabel,
              ),
              Editor(
                placeholder: _valuePlaceholder,
                controller: _valueController,
                label: _valueLabel,
                icon: Icons.monetization_on,
              ),
              ElevatedButton(
                child: Text(_confirmButton),
                style: ElevatedButton.styleFrom(primary: Colors.green),
                onPressed: () => _makeTransaction(context),
              ),
            ],
          ),
        ));
  }

  void _makeTransaction(BuildContext context) {
    final int? accountNumber = int.tryParse(_accountNumberController.text);
    final double? value = double.tryParse(_valueController.text);
    if (accountNumber == null || value == null)
      return; // equivalent of guard in swift

    final isFundsEnough =
        value <= Provider.of<Balance>(context, listen: false).value;
    if (isFundsEnough) {
      final transferCreated = Transaction(value, accountNumber);
      _setState(context, transferCreated);
      Navigator.pop(context, transferCreated);
    }
  }

  _setState(BuildContext context, Transaction transfer) {
    Provider.of<Transactions>(context, listen: false).add(transfer);
    Provider.of<Balance>(context, listen: false).subtract(transfer.value);
  }
}
