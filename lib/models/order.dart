import 'package:intl/intl.dart';
import 'package:pdv_collector/utils/money.dart';

class Order {
  int uidpk;
  String orderNumber;
  String createdDate;
  String amount;
  String name;

  Order(
      {this.uidpk = 0,
      this.orderNumber = "",
      this.createdDate = "",
      this.amount = "",
      this.name = ""});

  factory Order.createOrder(Map<String, dynamic> map) {
    final inputFormat = DateFormat('yyyy-MM-dd HH:mm:ss');
    final outputFormat = DateFormat('MM/dd/yyyy hh:mm');

    return Order(
      uidpk: int.parse(map!['uidpk']),
      orderNumber: map!['order_number'],
      createdDate: outputFormat.format(inputFormat.parse(map!['created_date'])),
      amount: transformMoney(double.parse(map!['amount'])),
      name: map!['name'].toString(),
    );
  }
}
