import 'package:pdv_collector/models/order.dart';

class Orders {
  static createOrders(List<Map<String, dynamic>> items) {
    return List<Order>.from(items.map((item) => Order.createOrder(item)));
  }
}
