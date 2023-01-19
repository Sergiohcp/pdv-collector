import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pdv_collector/controllers/db_controller.dart';
import 'package:pdv_collector/controllers/orders_controller.dart';
import 'package:pdv_collector/core/pdv_collector_colors.dart';
import 'package:pdv_collector/models/order.dart';
import 'package:pdv_collector/pages/widgets/order_row_widget.dart';
import 'package:pdv_collector/widgets/custom_button_widget.dart';
import 'package:pdv_collector/widgets/custom_divider_widget.dart';
import 'package:pdv_collector/widgets/custom_text_widget.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({Key? key}) : super(key: key);

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  final DBController dBController = Get.find<DBController>();
  final OrdersController ordersController = Get.find<OrdersController>();

  void getOrders() async {
    await ordersController.getOrders();
  }

  onSelectOrder(Order value) {
    ordersController.setSelectedOrder(value);
    Get.toNamed('/OrderDetails');
  }

  @override
  void initState() {
    getOrders();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(ordersController.orders.length);
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Obx(
        () => !ordersController.isOrdersLoading
            ? Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 48,
                        ),
                        CustomText(
                          'Pedidos',
                          fontSize: 'xl',
                          fontWeight: 'bold',
                          color: 'tannat.default',
                        ),
                        Expanded(
                          child: ListView.separated(
                            padding: EdgeInsets.only(top: 0),
                            separatorBuilder: (context, index) =>
                                CustomDivider(),
                            itemCount: ordersController.orders.length,
                            itemBuilder: (context, index) => OrderRow(
                                onSelectOrder: () {
                                  onSelectOrder(ordersController.orders[index]);
                                },
                                order: ordersController.orders[index]),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: CustomButton(
                        text: 'Desconectar',
                        onPressed: () {
                          dBController.disconnect();
                        }),
                  ),
                ],
              )
            : CircularProgressIndicator(
                color: PdvCollectorColors.primary,
              ),
      ),
    ));
  }
}
