import 'package:flutter/material.dart';
import 'package:pdv_collector/core/pdv_collector_colors.dart';
import 'package:pdv_collector/models/order.dart';
import 'package:pdv_collector/widgets/custom_text_widget.dart';

class OrderRow extends StatelessWidget {
  final Order order;
  final VoidCallback onSelectOrder;

  OrderRow({Key? key, required this.order, required this.onSelectOrder});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSelectOrder,
      child: Container(
        decoration: BoxDecoration(color: PdvCollectorColors.white),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    order.orderNumber,
                  ),
                  CustomText(
                    order.createdDate,
                  ),
                  CustomText(
                    order.amount,
                  ),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              CustomText(
                order.name,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
