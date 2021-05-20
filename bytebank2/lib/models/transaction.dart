import 'contact.dart';

class Transaction {
  final String id;
  final double value;
  final Contact contact;

  Transaction(
    this.id,
    this.value,
    this.contact,
  );

  @override
  String toString() {
    return 'Transaction{id: $id, value: $value, contact: $contact}';
  }

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
        json['id'], json['value'], Contact.fromJson(json['contact']));
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'value': value, 'contact': contact.toJson()};
  }
}
