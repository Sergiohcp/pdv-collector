import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_datawedge/flutter_datawedge.dart';
import 'package:flutter_datawedge/models/scan_result.dart';
import 'package:get/get.dart';
import 'package:pdv_collector/widgets/custom_button_widget.dart';
import 'package:pdv_collector/widgets/custom_text_widget.dart';

class BarcodePage extends StatefulWidget {
  const BarcodePage({Key? key}) : super(key: key);

  @override
  State<BarcodePage> createState() => _BarcodePageState();
}

class _BarcodePageState extends State<BarcodePage> {
  FlutterDataWedge dw = FlutterDataWedge(profileName: "PDV Coletor");
  late StreamSubscription onScanSubscription;

  String barcode = "";

  onScan(ScanResult result) {
    setState(() {
      barcode = result.data;
    });
  }

  startScan() {
    this.onScanSubscription = dw.onScanResult.listen(onScan);
  }

  stopScan() {
    this.onScanSubscription.cancel();
  }

  @override
  void initState() {
    startScan();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [

          CustomText(
            "Código: ${barcode}",
            fontSize: 'xl',
          ),
          SizedBox(
            height: 16,
          ),
          CustomButton(
              text: "Voltar",
              onPressed: () {
                stopScan();
                Get.back();
              })
        ]),
      ),
    );
  }
}
