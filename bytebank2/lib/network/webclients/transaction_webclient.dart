import 'dart:convert';

import 'package:bytebank2/models/transaction.dart';

import '../webclient.dart';

class TransactionWebClient {
  final uri = Uri.parse("http://192.168.86.39:8080/transactions");

  Future<List<Transaction>> findAll() async {
    final response =
        await WebClient().client.get(uri).timeout(Duration(seconds: 5));
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
  Future<Transaction> save(Transaction transaction) async {
    final response = await WebClient()
        .client
        .post(
          uri,
          headers: {"Content-Type": "application/json", "password": "1000"},
          body: jsonEncode(transaction.toJson()),
        )
        .timeout(Duration(seconds: 5));
    return Transaction.fromJson(jsonDecode(response.body));
  }
}
