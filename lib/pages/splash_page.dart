import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pdv_collector/controllers/db_controller.dart';
import 'package:pdv_collector/core/pdv_collector_colors.dart';
import 'package:pdv_collector/core/pdv_collector_images.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final DBController dbController = Get.find<DBController>();

  void verifyCredentials() async {
    final prefs = await SharedPreferences.getInstance();
    final String? host = prefs.getString('host');
    final String? user = prefs.getString('user');
    final String? password = prefs.getString('password');
    final String? database = prefs.getString('database');
    if (host!.isNotEmpty &&
        user!.isNotEmpty &&
        password!.isNotEmpty &&
        database!.isNotEmpty) {
      dbController.connect(host, user, password, database);
      return;
    }
    Get.offAllNamed('/DB');
  }

  @override
  void initState() {
    verifyCredentials();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: PdvCollectorColors.white),
        child: Center(
          child: Image.asset(
            PdvCollectorImages.logo,
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
