import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pdv_collector/controllers/db_controller.dart';
import 'package:pdv_collector/controllers/orders_controller.dart';
import 'package:pdv_collector/core/pdv_collector_colors.dart';
import 'package:pdv_collector/core/pdv_collector_text_styles.dart';
import 'package:pdv_collector/models/order.dart';
import 'package:pdv_collector/pages/widgets/order_item_widget.dart';

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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 48,
                        ),
                        Text(
                          'Pedidos',
                          style: PdvCollectorTextStyles.title,
                        ),
                        Expanded(
                          child: ListView.separated(
                            separatorBuilder: (context, index) => Divider(
                              height: 20,
                              thickness: 2,
                              color: PdvCollectorColors.black,
                            ),
                            itemCount: ordersController.orders.length,
                            itemBuilder: (context, index) => OrderItem(
                                onSelectOrder: () {
                                  onSelectOrder(ordersController.orders[index]);
                                },
                                order: ordersController.orders[index]),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width - 32,
                        child: ElevatedButton(
                          onPressed: () {
                            dBController.disconnect();
                          },
                          child: Text('Desconectar'),
                        ),
                      )
                    ],
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
