import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pdv_collector/bindings/orders_binding.dart';
import 'package:pdv_collector/controllers/db_controller.dart';
import 'package:pdv_collector/core/pdv_collector_colors.dart';
import 'package:pdv_collector/pages/db_page.dart';
import 'package:pdv_collector/pages/order_details_page.dart';
import 'package:pdv_collector/pages/orders_page.dart';
import 'package:pdv_collector/pages/splash_page.dart';

class PdvCollectorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put<DBController>(DBController());

    return GetMaterialApp(
      title: 'Pdv Collector',
      theme: ThemeData(
          primarySwatch: PdvCollectorColors.tannat,
          primaryColor: PdvCollectorColors.primary,
          brightness: Brightness.light),
      navigatorKey: Get.key,
      initialRoute: '/Splash',
      getPages: [
        GetPage(name: '/Splash', page: () => SplashPage()),
        GetPage(name: '/DB', page: () => DBPage()),
        GetPage(
            name: '/Orders',
            page: () => OrdersPage(),
            binding: OrdersBinding()),
        GetPage(
            name: '/OrderDetails',
            page: () => OrderDetailsPage(),
            binding: OrdersBinding()),
      ],
      debugShowCheckedModeBanner: false,
    );
  }
}
