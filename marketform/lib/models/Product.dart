class Product {
  final String name;
  final int quantity;
  final double amount;

  Product(
    this.name,
    this.quantity,
    this.amount,
  );

  @override
  String toString() {
    return 'Product{name: $name, quantity: $quantity, amount: $amount}';
  }
}
