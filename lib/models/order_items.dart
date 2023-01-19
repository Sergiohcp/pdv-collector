import 'package:pdv_collector/models/order_item.dart';

class OrderItems {
  static createOrderItems(List<Map<String, dynamic>> items) {
    return List<OrderItem>.from(
        items.map((item) => OrderItem.createOrderItem(item)));
  }
}
