import 'dart:async';

import 'package:get/get.dart';
import 'package:pdv_collector/controllers/db_controller.dart';

class OrdersRepository {
  final dbController = Get.find<DBController>();

  Future getOrders() async {
    var result = await dbController.db.execute('select * from torder limit 3');
    return result;
  }
}
