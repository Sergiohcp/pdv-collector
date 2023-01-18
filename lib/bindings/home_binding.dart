import 'package:get/get.dart';
import 'package:pdv_collector/controllers/home_controller.dart';
import 'package:pdv_collector/repositories/home_repository.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    final homeRepository = HomeRepository();
    Get.put<HomeController>(HomeController(homeRepository: homeRepository));
  }
}
