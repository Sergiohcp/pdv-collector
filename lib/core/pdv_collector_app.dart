import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pdv_collector/bindings/db_binding.dart';
import 'package:pdv_collector/bindings/home_binding.dart';
import 'package:pdv_collector/core/pdv_collector_colors.dart';
import 'package:pdv_collector/pages/db_page.dart';
import 'package:pdv_collector/pages/home_page.dart';
import 'package:pdv_collector/pages/splash_page.dart';

class PdvCollectorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Pdv Collector',
      theme: ThemeData(
          primarySwatch: PdvCollectorColors.tannat,
          primaryColor: PdvCollectorColors.primary,
          brightness: Brightness.light),
      navigatorKey: Get.key,
      initialRoute: '/Splash',
      getPages: [
        GetPage(
            name: '/Splash', page: () => SplashPage(), binding: DBBinding()),
        GetPage(name: '/DB', page: () => DBPage(), binding: DBBinding()),
        GetPage(name: '/Home', page: () => HomePage(), binding: HomeBinding()),
      ],
      debugShowCheckedModeBanner: false,
    );
  }
}
