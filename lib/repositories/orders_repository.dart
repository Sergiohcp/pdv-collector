import 'dart:async';

import 'package:get/get.dart';
import 'package:pdv_collector/controllers/db_controller.dart';

class OrdersRepository {
  final dbController = Get.find<DBController>();

  Future getOrders() async {
    var result = await dbController.db.execute(
        "select t.uidpk, t.order_number, t.created_date, t.amount, c.full_name as name from torder t left join torder_customer c on t.uidpk = c.order_uid where t.order_type = 'V' and t.status = 'IN_PROGRESS' and (t.checked is null or t.checked = false) order by t.uidpk asc");
    return result;
  }

  Future getOrderItems(int orderId) async {
    var result = await dbController.db.execute(
        "SELECT i.uidpk, i.skucode, p.name, i.quantity from torder_item i inner join tproduct p on i.skucode = p.skucode where i.order_uid = ${orderId} order by i.uidpk ");
    return result;
  }
}
