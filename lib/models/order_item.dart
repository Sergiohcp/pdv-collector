class OrderItem {
  int uidpk;
  String sku;
  String productName;
  int quantity;
  bool checked;

  OrderItem({
    this.uidpk = 0,
    this.sku = "",
    this.productName = "",
    this.quantity = 0,
    this.checked = false,
  });

  factory OrderItem.createOrderItem(Map<String, dynamic> map) {
    return OrderItem(
      uidpk: map!['uidpk'],
      sku: map!['skucode'],
      productName: map!['name'],
      quantity: map!['quantity'].toInt(),
      checked: map!['checked'] == 1,
    );
  }
}
