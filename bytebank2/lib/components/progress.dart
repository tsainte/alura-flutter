import 'package:flutter/material.dart';

class Progress extends StatelessWidget {
  final String message;
  Progress({this.message = "Loading..."});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(message),
          ),
        ],
      ),
    );
  }
}
