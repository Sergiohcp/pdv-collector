import 'package:flutter/material.dart';
import 'package:pdv_collector/core/pdv_collector_colors.dart';

class PdvCollectorTextStyles {
  static final TextStyle title = TextStyle(
    color: PdvCollectorColors.primary,
    fontSize: 20,
    fontWeight: FontWeight.w600,
  );

  static final TextStyle label = TextStyle(
    color: PdvCollectorColors.secondary,
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );

  static final TextStyle orderItem = TextStyle(
    color: PdvCollectorColors.black,
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );

  static final TextStyle orderDetailsTitle = TextStyle(
    color: PdvCollectorColors.black,
    fontSize: 18,
    fontWeight: FontWeight.w500,
  );
}
