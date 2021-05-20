import 'dart:async';

import 'package:bytebank2/components/progress.dart';
import 'package:bytebank2/components/response_dialog.dart';
import 'package:bytebank2/models/contact.dart';
import 'package:bytebank2/models/transaction.dart';
import 'package:bytebank2/network/webclients/transaction_webclient.dart';
import 'package:bytebank2/screens/transaction_auth_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class TransactionForm extends StatefulWidget {
  final Contact contact;

  TransactionForm(this.contact);

  @override
  _TransactionFormState createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final TextEditingController _valueController = TextEditingController();
  final String uuid = Uuid().v4();
  var _isSending = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New transaction'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Visibility(
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Progress(message: "Sending..."),
                ),
                visible: _isSending,
              ),
              Text(
                widget.contact.name,
                style: TextStyle(
                  fontSize: 24.0,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Text(
                  widget.contact.accountNumber.toString(),
                  style: TextStyle(
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: TextField(
                  controller: _valueController,
                  style: TextStyle(fontSize: 24.0),
                  decoration: InputDecoration(labelText: 'Value'),
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: SizedBox(
                  width: double.maxFinite,
                  child: ElevatedButton(
                    child: Text('Transfer'),
                    onPressed: _makeTransfer,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _makeTransfer() {
    final double value = double.tryParse(_valueController.text);
    final transactionCreated = Transaction(uuid, value, widget.contact);
    showCupertinoDialog(
      context: context,
      builder: (BuildContext contextDialog) => TransactionAuthDialog(
        onConfirm: (String password) {
          _save(transactionCreated, password, contextDialog);
        },
      ),
    );
  }

  void _save(Transaction transactionCreated, String password,
      BuildContext contextDialog) {
    _send(transactionCreated, password)
        .then((newTransaction) => _showSuccess(newTransaction));
  }

  Future<Transaction> _send(
      Transaction transactionCreated, String password) async {
    setState(() => _isSending = true);
    final newTransaction = await TransactionWebClient()
        .save(transactionCreated, password)
        .catchError((e) {
      _showFailureMessage(context, message: "Timeout");
    }, test: (e) => e is TimeoutException).catchError((e) {
      _showFailureMessage(context, message: e.message);
    }, test: (e) => e is HttpException).catchError((e) {
      _showFailureMessage(context);
    }).whenComplete(() => setState(() => _isSending = false));
    return newTransaction;
  }

  Future<void> _showSuccess(Transaction newTransaction) async {
    if (newTransaction != null) {
      await showDialog(
        context: context,
        builder: (BuildContext context) => SuccessDialog("Transfer succeeded"),
      );
      Navigator.pop(context);
    }
  }

  void _showFailureMessage(BuildContext context,
      {String message = "Unknown error"}) {
    showDialog(
      context: context,
      builder: (BuildContext context) => FailureDialog(message),
    );
  }
}
