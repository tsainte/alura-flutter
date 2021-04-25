import 'package:bytebank/components/edit_field.dart';
import 'package:bytebank/models/transfer.dart';
import 'package:flutter/material.dart';

const _appBarTitle = "Create Transfer";
const _accountNumberLabel = "Account Number";
const _accountNumberHintLabel = "0000";
const _amountLabel = "Amount";
const _amountHintLabel = "0.00";
const _confirmButton = "Confirm";

class TransferForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TransferFormState();
  }
}

class TransferFormState extends State<TransferForm> {
  final TextEditingController _accountNumberController =
      TextEditingController();
  final TextEditingController _amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            EditField(
              controller: _accountNumberController,
              labelText: _accountNumberLabel,
              hintText: _accountNumberHintLabel,
            ),
            EditField(
              controller: _amountController,
              labelText: _amountLabel,
              hintText: _amountHintLabel,
              icon: Icons.monetization_on,
            ),
            ElevatedButton(
              onPressed: () => _createTransfer(context),
              child: Text(_confirmButton),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text(_appBarTitle),
      ),
    );
  }

  void _createTransfer(BuildContext context) {
    final int accountNumber = int.tryParse(_accountNumberController.text);
    final double amount = double.tryParse(_amountController.text);

    if (accountNumber != null && amount != null) {
      final createdTransfer = Transfer(amount, accountNumber);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(createdTransfer.toString()),
          padding: const EdgeInsets.fromLTRB(24, 8, 24, 8),
          behavior: SnackBarBehavior.floating,
        ),
      );

      Navigator.pop(context, createdTransfer);
    }
  }
}
