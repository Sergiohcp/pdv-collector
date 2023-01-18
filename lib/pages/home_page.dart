import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pdv_collector/controllers/home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController homeController = Get.find<HomeController>();

  void getOrders() async {
    await homeController.getOrders();
  }

  @override
  void initState() {
    getOrders();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Text('PDV COLLECTOR'),
        ));
  }
}
