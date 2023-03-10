import 'dart:convert';

import 'package:get/get.dart';
import 'package:mysql1/mysql1.dart';
import 'package:pdv_collector/models/order.dart';
import 'package:pdv_collector/models/order_item.dart';
import 'package:pdv_collector/models/order_items.dart';
import 'package:pdv_collector/models/orders.dart';
import 'package:pdv_collector/repositories/orders_repository.dart';

class OrdersController {
  final OrdersRepository ordersRepository;
  final RxList<Order> _orders = <Order>[].obs;
  final Rx<Order> _selectedOrder = Order().obs;
  final RxList<OrderItem> _orderItems = <OrderItem>[].obs;
  var _isOrdersLoading = false.obs;
  var _isOrderItemsLoading = false.obs;

  OrdersController({required this.ordersRepository});

  List<Order> get orders => _orders.value;

  Order get selectedOrder => _selectedOrder.value;

  List<OrderItem> get orderItems => _orderItems.value;

  bool get isOrdersLoading => _isOrdersLoading.value;

  bool get isOrderItemsLoading => _isOrderItemsLoading.value;

  void setOrders(List<Order> value) {
    _orders.value = value;
  }

  void setIsOrdersLoading(bool value) {
    _isOrdersLoading.value = value;
  }

  void setSelectedOrder(Order value) {
    _selectedOrder.value = value;
  }

  void setOrderItems(List<OrderItem> value) {
    _orderItems.value = value;
  }

  void setIsOrderItemsLoading(bool value) {
    _isOrderItemsLoading.value = value;
  }

  Future getOrders() async {
    try {
      setIsOrdersLoading(true);
      Results result = await this.ordersRepository.getOrders();
      List<Map<String, dynamic>> dbOrders = [];
      for (var row in result) {
        dbOrders.add(jsonDecode(row['response'].toString()));
      }
      final orders = Orders.createOrders(dbOrders);
      setOrders(orders);
    } catch (error) {
      print(error);
    } finally {
      setIsOrdersLoading(false);
    }
  }

  Future getOrderItems() async {
    try {
      setIsOrderItemsLoading(true);
      Results result =
          await this.ordersRepository.getOrderItems(selectedOrder.uidpk);
      List<Map<String, dynamic>> dbOrderItems = [];
      for (var row in result) {
        dbOrderItems.add(jsonDecode(row['response'].toString()));
      }
      final orderItems = OrderItems.createOrderItems(dbOrderItems);
      setOrderItems(orderItems);
    } catch (error) {
      print(error);
    } finally {
      setIsOrderItemsLoading(false);
    }
  }
}
