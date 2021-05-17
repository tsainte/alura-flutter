import 'package:bytebank/models/transfer.dart';
import 'package:bytebank/screens/transfer_form.dart';
import 'package:flutter/material.dart';

const _appBarTitle = "Transfers";

class TransferList extends StatefulWidget {
  final List<Transfer> _transfers = [];

  @override
  State<StatefulWidget> createState() {
    return TransferListState();
  }
}

class TransferListState extends State<TransferList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: widget._transfers.length,
        itemBuilder: (context, index) {
          final transfer = widget._transfers[index];
          return TransferItem(transfer);
        },
      ),
      appBar: AppBar(
        title: Text(_appBarTitle),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              return TransferForm();
            }),
          ).then((receivedTransfer) => _refresh(receivedTransfer));
        },
      ),
    );
  }

  void _refresh(Transfer? receivedTransfer) {
    if (receivedTransfer != null) {
      setState(() => widget._transfers.add(receivedTransfer));
    }
  }
}

class TransferItem extends StatelessWidget {
  final Transfer _transfer;

  TransferItem(this._transfer);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(_transfer.amount.toString()),
        subtitle: Text(_transfer.accountNumber.toString()),
      ),
    );
  }
}
