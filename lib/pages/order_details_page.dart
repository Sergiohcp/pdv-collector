import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pdv_collector/controllers/db_controller.dart';
import 'package:pdv_collector/controllers/orders_controller.dart';
import 'package:pdv_collector/core/pdv_collector_colors.dart';
import 'package:pdv_collector/core/pdv_collector_text_styles.dart';
import 'package:pdv_collector/pages/widgets/order_item_row.dart';
import 'package:pdv_collector/widgets/custom_divider.dart';

class OrderDetailsPage extends StatefulWidget {
  const OrderDetailsPage({Key? key}) : super(key: key);

  @override
  State<OrderDetailsPage> createState() => _OrderDetailsPageState();
}

class _OrderDetailsPageState extends State<OrderDetailsPage> {
  final DBController dBController = Get.find<DBController>();
  final OrdersController ordersController = Get.find<OrdersController>();

  getOrderItems() {
    ordersController.getOrderItems();
  }

  @override
  void initState() {
    getOrderItems();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final selectedOrder = ordersController.selectedOrder;
    final titleStyle = PdvCollectorTextStyles.orderDetailsTitle;
    final itemStyle = PdvCollectorTextStyles.orderItem;
    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: Obx(
              () => !ordersController.isOrderItemsLoading
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 24,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 16, horizontal: 16),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text("Pedido ${selectedOrder.orderNumber}",
                                        style: titleStyle),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Text(selectedOrder.createdDate,
                                        style: itemStyle)
                                  ],
                                ),
                              ),
                              CustomDivider(),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 16),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(selectedOrder.name, style: itemStyle),
                                  ],
                                ),
                              ),
                              CustomDivider(),
                              Expanded(
                                child: ListView.separated(
                                  padding: EdgeInsets.only(top: 0),
                                  separatorBuilder: (context, index) =>
                                      CustomDivider(),
                                  itemCount: ordersController.orderItems.length,
                                  itemBuilder: (context, index) => OrderItemRow(
                                      orderItem:
                                          ordersController.orderItems[index]),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Lido: "),
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: PdvCollectorColors.green),
                                  child: Center(
                                      child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8, horizontal: 16),
                                    child: Text('0'),
                                  )),
                                )
                              ],
                            )
                          ],
                        )
                      ],
                    )
                  : CircularProgressIndicator(
                      color: PdvCollectorColors.primary,
                    ),
            )));
  }
}
