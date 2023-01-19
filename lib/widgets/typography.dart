import 'package:flutter/material.dart';
import 'package:pdv_collector/core/pdv_collector_colors.dart';

class Typography extends StatelessWidget {
  final String text;
  final double? size;
  final String? weight;
  final String? color;

  Typography(this.text,
      {Key? key, this.size = 16, this.weight = 'normal', this.color = 'black'});

  getWeight() {
    switch (this.weight) {
      case 'normal':
        return FontWeight.w400;
      case 'medium':
        return FontWeight.w500;
      case 'bold':
        return FontWeight.w600;
      default:
        return FontWeight.w400;
    }
  }

  getColor() {
    switch (this.color) {
      case 'tannat.default':
      case 'primary':
        return PdvCollectorColors.primary;
      case 'tannat.light':
      case 'secondary':
        return PdvCollectorColors.secondary;
      case 'black':
        return PdvCollectorColors.black;
      case 'white':
        return PdvCollectorColors.white;
      case 'gray':
        return PdvCollectorColors.gray;
      case 'gray.dark':
        return PdvCollectorColors.grayDark;
      case 'gray.darker':
        return PdvCollectorColors.grayDarker;
      default:
        return PdvCollectorColors.black;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Text(this.text,
        style: TextStyle(
          fontSize: this.size,
          fontWeight: getWeight(),
          color: getColor(),
        ));
  }
}
