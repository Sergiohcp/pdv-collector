import 'package:flutter/material.dart';
import 'package:pdv_collector/core/pdv_collector_colors.dart';

class CustomText extends StatelessWidget {
  final String text;
  final dynamic fontSize;
  final String? fontWeight;
  final String? color;

  const CustomText(this.text,
      {Key? key,
      this.fontSize = 'md',
      this.fontWeight = 'normal',
      this.color = 'black'});

  double getFontSize() {
    if (!(this.fontSize is String)) return this.fontSize.toDouble();
    switch (this.fontSize) {
      case 'md':
        return 16;
      case 'lg':
        return 18;
      case 'xl':
        return 20;
      default:
        return 16;
    }
  }

  getFontWeight() {
    switch (this.fontWeight) {
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
          fontSize: getFontSize(),
          fontWeight: getFontWeight(),
          color: getColor(),
        ));
  }
}
