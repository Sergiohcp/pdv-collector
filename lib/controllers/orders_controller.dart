import 'package:get/get.dart';
import 'package:mysql_client/mysql_client.dart';
import 'package:pdv_collector/models/order.dart';
import 'package:pdv_collector/models/orders.dart';
import 'package:pdv_collector/repositories/orders_repository.dart';

class OrdersController {
  final OrdersRepository ordersRepository;
  final _orders = [].obs;
  var _isOrdersLoading = false.obs;

  final _selectedOrder = Order().obs;

  OrdersController({required this.ordersRepository});

  List<dynamic> get orders => _orders.value;

  bool get isOrdersLoading => _isOrdersLoading.value;

  Order get selectedOrder => _selectedOrder.value;

  void setOrders(List<Order> value) {
    _orders.value = value;
  }

  void setIsOrdersLoading(bool value) {
    _isOrdersLoading.value = value;
  }

  void setSelectedOrder(Order value) {
    _selectedOrder.value = value;
  }

  Future getOrders() async {
    try {
      setIsOrdersLoading(true);
      IResultSet resultSet = await this.ordersRepository.getOrders();
      List<Map<String, dynamic>> dbOrders = [];
      for (var row in resultSet.rows) {
        dbOrders.add(row.assoc());
      }
      final orders = Orders.createOrders(dbOrders);
      print(orders.length);
      setOrders(orders);
    } catch (error) {
      print(error);
    } finally {
      setIsOrdersLoading(false);
    }
  }
}
