import 'package:flutter/material.dart';

import 'models/Product.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Register Product'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: _nameController,
                decoration: InputDecoration(labelText: "Name"),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: TextField(
                  controller: _quantityController,
                  decoration: InputDecoration(labelText: "Quantity"),
                  keyboardType: TextInputType.number,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: TextField(
                  controller: _amountController,
                  decoration: InputDecoration(labelText: "Amount"),
                  keyboardType: TextInputType.number,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: ElevatedButton(
                  onPressed: () {
                    final String name = _nameController.text;
                    final int quantity =
                        int.tryParse(_quantityController.text) ?? 0;
                    final double amount =
                        double.tryParse(_amountController.text) ?? 0;

                    final Product newProduct = Product(name, quantity, amount);
                    debugPrint('$newProduct');
                  },
                  child: Text('Register'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
