import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pdv_collector/core/pdv_collector_colors.dart';

void showToaster({String title = "", String message = ""}) {
  Get.snackbar(title, message,
      snackPosition: SnackPosition.BOTTOM,
      colorText: PdvCollectorColors.white,
      backgroundColor: PdvCollectorColors.grayDark,
      borderRadius: 0,
      margin: EdgeInsets.all(0),
      animationDuration: Duration(milliseconds: 2000));
}
