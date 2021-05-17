class Contact {
  final int id;
  final String name;
  final int accountNumber;

  Contact(
    this.id,
    this.name,
    this.accountNumber,
  );

  @override
  String toString() {
    return 'Contact{id: $id, name: $name, accountNumber: $accountNumber}';
  }

  factory Contact.fromJson(Map<String, dynamic> json) {
    return Contact(json['id'], json['name'], json['accountNumber']);
  }

  Map<String, dynamic> toJson() =>
      {'id': id, 'name': name, 'accountNumber': accountNumber};
}
