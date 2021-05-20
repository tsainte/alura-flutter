import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TransactionAuthDialog extends StatefulWidget {
  final Function(String password) onConfirm;
  TransactionAuthDialog({@required this.onConfirm});

  @override
  _TransactionAuthDialogState createState() => _TransactionAuthDialogState();
}

class _TransactionAuthDialogState extends State<TransactionAuthDialog> {
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text("Authenticate"),
      content: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CupertinoTextField(
          controller: passwordController,
          obscureText: true,
          maxLength: 4,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 64),
          keyboardType: TextInputType.number,
        ),
      ),
      actions: [
        CupertinoDialogAction(
          isDefaultAction: true,
          child: Text("Cancel"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        CupertinoDialogAction(
          isDefaultAction: true,
          child: Text("Confirm"),
          onPressed: () {
            widget.onConfirm(passwordController.text);
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
