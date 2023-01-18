import 'package:get/get.dart';
import 'package:pdv_collector/controllers/orders_controller.dart';
import 'package:pdv_collector/repositories/orders_repository.dart';

class OrdersBinding implements Bindings {
  @override
  void dependencies() {
    final ordersRepository = OrdersRepository();
    Get.put<OrdersController>(
        OrdersController(ordersRepository: ordersRepository));
  }
}
