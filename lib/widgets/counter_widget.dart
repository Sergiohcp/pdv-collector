import 'package:flutter/material.dart';
import 'package:pdv_collector/core/pdv_collector_colors.dart';
import 'package:pdv_collector/widgets/custom_text_widget.dart';

enum CounterType { primary, secondary }

enum CounterSize { small, large }

class Counter extends StatelessWidget {
  final String text;
  final int number;
  final CounterType? type;
  final CounterSize? size;

  const Counter(
      {Key? key,
      required this.text,
      required this.number,
      this.type = CounterType.primary,
      this.size = CounterSize.small});

  getColor() {
    switch (this.type) {
      case CounterType.primary:
        return PdvCollectorColors.green;
      case CounterType.secondary:
        return PdvCollectorColors.grayDark;
      default:
        return PdvCollectorColors.green;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomText(this.text),
        Container(
          width: 50,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: getColor()),
          child: Center(
              child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: CustomText(
              "${this.number}",
              color: 'white',
            ),
          )),
        )
      ],
    );
  }
}
