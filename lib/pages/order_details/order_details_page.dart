import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pdv_collector/controllers/db_controller.dart';
import 'package:pdv_collector/controllers/orders_controller.dart';
import 'package:pdv_collector/core/pdv_collector_colors.dart';
import 'package:pdv_collector/core/pdv_collector_images.dart';
import 'package:pdv_collector/pages/order_details/widgets/order_item_row_widget.dart';
import 'package:pdv_collector/widgets/counter_widget.dart';
import 'package:pdv_collector/widgets/custom_button_widget.dart';
import 'package:pdv_collector/widgets/custom_divider_widget.dart';
import 'package:pdv_collector/widgets/custom_text_widget.dart';

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
    return Scaffold(
        backgroundColor: PdvCollectorColors.white,
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
                                    CustomText(
                                      "Pedido ${selectedOrder.orderNumber}",
                                      fontSize: 20,
                                      fontWeight: 'bold',
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Flexible(
                                      child: CustomText(
                                        selectedOrder.createdDate,
                                      ),
                                    )
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
                                    CustomText(
                                      selectedOrder.name,
                                    ),
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
                                  itemBuilder: (context, index) {
                                    final item =
                                        ordersController.orderItems[index];

                                    return OrderItemRow(
                                        orderItem: item, checked: item.checked);
                                  },
                                ),
                              )
                            ],
                          ),
                        ),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Counter(
                                      text: "Lido: ",
                                      number: 0,
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Counter(
                                        text: "Falta: ",
                                        number: 0,
                                        type: CounterType.secondary),
                                  ],
                                )
                              ],
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            GestureDetector(
                              onTap: () {
                                print('CÓDIGO DE BARRAS');
                                Get.toNamed('/Barcode');
                              },
                              child: Image.asset(
                                PdvCollectorImages.barcode,
                                //width: 200,
                                fit: BoxFit.fill,
                              ),
                            ),
                            SizedBox(
                              height: 24,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: CustomButton(
                                      text: 'Finalizar',
                                      onPressed: null,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 16,
                                  ),
                                  Expanded(
                                    child: CustomButton(
                                      text: 'Cancelar',
                                      variant: CustomButtonVariant.outlined,
                                      onPressed: () {
                                        Get.back();
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        )
                      ],
                    )
                  : Center(
                      child: CircularProgressIndicator(
                        color: PdvCollectorColors.primary,
                      ),
                    ),
            )));
  }
}
