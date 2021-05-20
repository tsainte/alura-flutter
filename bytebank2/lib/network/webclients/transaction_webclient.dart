import 'dart:convert';

import 'package:bytebank2/models/transaction.dart';

import '../webclient.dart';

class TransactionWebClient {
  final uri = Uri.parse("http://192.168.86.39:8080/transactions");
  final _webclient = WebClient();
  Future<List<Transaction>> findAll() async {
    final response = await _webclient.client.get(uri);
    final List<dynamic> decodedJson = jsonDecode(response.body);
    return decodedJson
        .map((dynamic json) => Transaction.fromJson(json))
        .toList();
  }

  /* curl -X POST \
-H "Content-Type: application/json" \
-H "password: 1000" \
-d '{"value":200.0,"contact":{"name":"Tiago","accountNumber":1000}}' \
http://localhost:8080/transactions */
  Future<Transaction> save(Transaction transaction, String password) async {
    await Future.delayed(Duration(seconds: 2));
    final response = await _webclient.client.post(
      uri,
      headers: {"Content-Type": "application/json", "password": password},
      body: jsonEncode(transaction.toJson()),
    );

    if (response.statusCode == 200) {
      return Transaction.fromJson(jsonDecode(response.body));
    }
    throw HttpException(_getMessage(response.statusCode));
  }

  String _getMessage(int statusCode) =>
      errors.containsKey(statusCode) ? errors[statusCode] : "Unknown error";

  static const Map<int, String> errors = {
    400: "Invalid request",
    401: "Authentication failed!",
    409: "Duplicate transaction found"
  };
}

class HttpException implements Exception {
  final String message;

  HttpException(this.message);
}
