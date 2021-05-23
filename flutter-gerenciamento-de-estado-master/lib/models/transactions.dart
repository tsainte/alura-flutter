import 'package:bytebank/models/transaction.dart';
import 'package:flutter/material.dart';

class Transactions extends ChangeNotifier {
  List<Transaction> _transactions = [];

  List<Transaction> get transactions => _transactions;

  add(Transaction transfer) {
    _transactions.add(transfer);
    notifyListeners();
  }
}
