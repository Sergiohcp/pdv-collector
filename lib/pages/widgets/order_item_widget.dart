import 'package:flutter/material.dart';
import 'package:pdv_collector/core/pdv_collector_text_styles.dart';
import 'package:pdv_collector/models/order.dart';

class OrderItem extends StatelessWidget {
  final Order order;

  const OrderItem({Key? key, required this.order});

  Widget buildOrderRow(String key, String value) {
    return Row(
      children: [
        Text(
          key,
          style: PdvCollectorTextStyles.orderKey,
        ),
        SizedBox(
          width: 16,
        ),
        Text(
          value,
          style: PdvCollectorTextStyles.orderValue,
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Column(
        children: [
          buildOrderRow('Id:', order.uidpk),
          buildOrderRow('Nº:', "${order.orderNumber}"),
          buildOrderRow('Tipo:', order.orderType),
        ],
      ),
    );
  }
}
