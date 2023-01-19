class OrderItem {
  int uidpk;
  String sku;
  String productName;
  int quantity;

  OrderItem({
    this.uidpk = 0,
    this.sku = "",
    this.productName = "",
    this.quantity = 0,
  });

  factory OrderItem.createOrderItem(Map<String, dynamic> map) {
    return OrderItem(
      uidpk: int.parse(map!['uidpk']),
      sku: map!['skucode'],
      productName: map!['name'],
      quantity: double.parse(map!['quantity']).toInt(),
    );
  }
}
