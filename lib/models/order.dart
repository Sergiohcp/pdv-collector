class Order {
  String id;
  double total;

  Order({
    this.id = "",
    this.total = 0,
  });

  factory Order.createOrder(Map<String, dynamic> map) {
    return Order(
      id: map['id'] ?? "",
      total: map['total'] ?? 0,
    );
  }
}
