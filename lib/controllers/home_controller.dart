import 'package:mysql_client/mysql_client.dart';
import 'package:pdv_collector/repositories/home_repository.dart';

class HomeController {
  final HomeRepository homeRepository;

  HomeController({required this.homeRepository});

  Future getOrders() async {
    try {
      IResultSet orders = await this.homeRepository.getOrders();
      print(orders.rows);
    } catch (error) {
      print('error');
    }
  }
}
