import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pdv_collector/controllers/db_controller.dart';
import 'package:pdv_collector/controllers/home_controller.dart';
import 'package:pdv_collector/core/pdv_collector_colors.dart';
import 'package:pdv_collector/core/pdv_collector_text_styles.dart';
import 'package:pdv_collector/pages/widgets/order_item_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final DBController dBController = Get.find<DBController>();
  final HomeController homeController = Get.find<HomeController>();

  void getOrders() async {
    await homeController.getOrders();
  }

  @override
  void initState() {
    getOrders();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(homeController.orders.length);
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      child: Obx(
        () => !homeController.isOrdersLoading
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
                              color: PdvCollectorColors.grayDarker,
                            ),
                            itemCount: homeController.orders.length,
                            itemBuilder: (context, index) =>
                                OrderItem(order: homeController.orders[index]),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                      onPressed: () {
                        dBController.disconnect();
                      },
                      child: Text('Desconectar'),
                    ),
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
