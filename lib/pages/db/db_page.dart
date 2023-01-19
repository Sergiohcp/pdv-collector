import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pdv_collector/controllers/db_controller.dart';
import 'package:pdv_collector/core/pdv_collector_colors.dart';
import 'package:pdv_collector/utils/toaster.dart';
import 'package:pdv_collector/widgets/custom_button_widget.dart';
import 'package:pdv_collector/widgets/custom_text_widget.dart';

class DBPage extends StatefulWidget {
  const DBPage({Key? key}) : super(key: key);

  @override
  State<DBPage> createState() => _DBPageState();
}

class _DBPageState extends State<DBPage> {
  final DBController dbController = Get.find<DBController>();

  final hostController = TextEditingController();
  final userController = TextEditingController();
  final passwordController = TextEditingController();
  final databaseController = TextEditingController();

  var credentialsLoading = true;

  connect(String host, String user, String password, String database) {
    dbController.connect(hostController.text, userController.text,
        passwordController.text, databaseController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(
      () => !dbController.isConnectLoading || !credentialsLoading
          ? Padding(
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    'Conexão:',
                    color: 'tannat.default',
                    fontSize: 'xl',
                    fontWeight: 'bold',
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  TextField(
                    controller: hostController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Host',
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  TextField(
                    controller: userController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'User',
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  TextField(
                    controller: passwordController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  TextField(
                    controller: databaseController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Database',
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  CustomButton(
                    onPressed: () {
                      if (hostController.text.isEmpty ||
                          userController.text.isEmpty ||
                          passwordController.text.isEmpty ||
                          databaseController.text.isEmpty) {
                        showToaster(
                            title: "Erro",
                            message: "Preencha todos os campos.");
                        return;
                      }
                      this.connect(hostController.text, userController.text,
                          passwordController.text, databaseController.text);
                    },
                    text: 'Conectar',
                  ),
                ],
              ),
            )
          : Center(
              child: CircularProgressIndicator(
                color: PdvCollectorColors.primary,
              ),
            ),
    ));
  }
}
