import 'package:flutter/material.dart';
import 'package:pdv_collector/core/pdv_collector_text_styles.dart';
import 'package:pdv_collector/models/order.dart';

class OrderRow extends StatelessWidget {
  final Order order;
  final VoidCallback onSelectOrder;

  OrderRow({Key? key, required this.order, required this.onSelectOrder});

  @override
  Widget build(BuildContext context) {
    final style = PdvCollectorTextStyles.orderItem;

    return GestureDetector(
      onTap: onSelectOrder,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${order.orderNumber}",
                  style: style,
                ),
                Text(
                  order.createdDate,
                  style: style,
                ),
                Text(
                  order.amount,
                  style: style,
                ),
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              order.name,
              style: style,
            ),
          ],
        ),
      ),
    );
  }
}
