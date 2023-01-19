import 'package:flutter/material.dart';
import 'package:pdv_collector/core/pdv_collector_colors.dart';

class CustomDivider extends StatelessWidget {
  CustomDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 2,
      decoration: BoxDecoration(
        color: PdvCollectorColors.black,
      ),
    );
  }
}
