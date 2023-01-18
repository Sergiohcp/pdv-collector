class Order {
  String uidpk;
  int orderNumber;
  String orderType;
  String createdDate;
  double amount;

  Order({
    this.uidpk = "",
    this.orderNumber = 0,
    this.orderType = "",
    this.createdDate = "",
    this.amount = 0,
  });

  factory Order.createOrder(Map<String, dynamic> map) {
    return Order(
      uidpk: map['uidpk'] ?? "",
      orderNumber: int.parse(map['order_number']) ?? 0,
      orderType: map['order_type'] ?? "",
      createdDate: map['created_date'] ?? "",
      amount: double.parse(map['amount']) ?? 0,
    );
  }
}
