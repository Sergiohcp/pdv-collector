class Order {
  String uidpk;
  int orderNumber;
  String orderType;

  Order({
    this.uidpk = "",
    this.orderNumber = 0,
    this.orderType = "",
  });

  factory Order.createOrder(Map<String, dynamic> map) {
    return Order(
      uidpk: map['uidpk'] ?? "",
      orderNumber: int.parse(map['order_number']) ?? 0,
      orderType: map['order_type'] ?? "",
    );
  }
}
