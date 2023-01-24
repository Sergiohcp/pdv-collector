import 'package:flutter/material.dart';
import 'package:pdv_collector/core/pdv_collector_colors.dart';
import 'package:pdv_collector/models/order_item.dart';
import 'package:pdv_collector/widgets/custom_text_widget.dart';

class OrderItemRow extends StatelessWidget {
  final OrderItem orderItem;
  final bool checked;

  OrderItemRow({Key? key, required this.orderItem, required this.checked});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: this.checked
              ? PdvCollectorColors.green
              : PdvCollectorColors.white),
      child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Row(
                  children: [
                    CustomText(
                      orderItem.sku,
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Flexible(child: CustomText(orderItem.productName)),
                    SizedBox(
                      width: 16,
                    ),
                  ],
                ),
              ),
              CustomText("${orderItem.quantity}")
            ],
          )),
    );
  }
}
