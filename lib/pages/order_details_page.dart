import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pdv_collector/controllers/db_controller.dart';
import 'package:pdv_collector/controllers/orders_controller.dart';
import 'package:pdv_collector/core/pdv_collector_colors.dart';
import 'package:pdv_collector/core/pdv_collector_text_styles.dart';

class OrderDetailsPage extends StatefulWidget {
  const OrderDetailsPage({Key? key}) : super(key: key);

  @override
  State<OrderDetailsPage> createState() => _OrderDetailsPageState();
}

class _OrderDetailsPageState extends State<OrderDetailsPage> {
  final DBController dBController = Get.find<DBController>();
  final OrdersController ordersController = Get.find<OrdersController>();

  @override
  Widget build(BuildContext context) {
    final selectedOrder = ordersController.selectedOrder;
    final titleStyle = PdvCollectorTextStyles.orderDetailsTitle;
    final itemStyle = PdvCollectorTextStyles.orderItem;
    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: 48,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Pedido ${selectedOrder.orderNumber}",
                              style: titleStyle),
                          SizedBox(
                            width: 8,
                          ),
                          Text(selectedOrder.createdDate, style: itemStyle)
                        ],
                      ),
                    ),
                    Divider(
                      height: 20,
                      thickness: 2,
                      color: PdvCollectorColors.black,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("Sergio Henrique", style: itemStyle),
                        ],
                      ),
                    ),
                    Divider(
                      height: 20,
                      thickness: 2,
                      color: PdvCollectorColors.black,
                    )
                  ],
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Text("Pedido ${selectedOrder.orderNumber}"),
                        Text(selectedOrder.createdDate)
                      ],
                    )
                  ],
                )
              ],
            )));
  }
}
