import 'package:flutter/material.dart';

class Balance extends ChangeNotifier {
  double value;

  Balance(this.value);

  add(double value) {
    this.value += value;
    notifyListeners();
  }

  subtract(double value) {
    this.value -= value;
    notifyListeners();
  }

  @override
  String toString() => "R\$ $value";
}
