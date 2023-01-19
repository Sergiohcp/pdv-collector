import 'package:flutter/material.dart';
import 'package:pdv_collector/core/pdv_collector_text_styles.dart';
import 'package:pdv_collector/models/order_item.dart';

class OrderItemRow extends StatelessWidget {
  final OrderItem orderItem;

  OrderItemRow({Key? key, required this.orderItem});

  @override
  Widget build(BuildContext context) {
    final style = PdvCollectorTextStyles.orderItem;

    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        child: Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Row(
                  children: [
                    Text(
                      orderItem.sku,
                      style: style,
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Flexible(child: Text(orderItem.productName, style: style)),
                    SizedBox(
                      width: 16,
                    ),
                  ],
                ),
              ),
              Text("${orderItem.quantity}", style: style)
            ],
          ),
        ));
  }
}
