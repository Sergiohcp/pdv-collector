import 'dart:async';

import 'package:get/get.dart';
import 'package:pdv_collector/controllers/db_controller.dart';

class OrdersRepository {
  final dbController = Get.find<DBController>();

  Future getOrders() async {
    var result =
        await dbController.db.query("call get_conference_pending_orders()");
    return result;
  }

  Future getOrderItems(int orderId) async {
    var result = await dbController.db
        .query("call get_orders_items_to_conference(${orderId})");
    return result;
  }
}
