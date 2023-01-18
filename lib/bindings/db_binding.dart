import 'package:get/get.dart';
import 'package:pdv_collector/controllers/db_controller.dart';

class DBBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<DBController>(DBController());
  }
}
