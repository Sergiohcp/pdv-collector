import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pdv_collector/controllers/db_controller.dart';
import 'package:pdv_collector/core/pdv_collector_colors.dart';
import 'package:pdv_collector/core/pdv_collector_text_styles.dart';
import 'package:pdv_collector/utils/toaster.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  verifyCredentials() async {
    final prefs = await SharedPreferences.getInstance();
    final String? host = prefs.getString('host');
    final String? user = prefs.getString('user');
    final String? password = prefs.getString('password');
    final String? database = prefs.getString('database');
    if (host!.isNotEmpty &&
        user!.isNotEmpty &&
        password!.isNotEmpty &&
        database!.isNotEmpty) {
      this.connect(host, user, password, database);
    }
    credentialsLoading = false;
  }

  @override
  void initState() {
    verifyCredentials();
    super.initState();
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
                  Text(
                    'Conexão:',
                    style: PdvCollectorTextStyles.title,
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
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
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
                      child: Text('Conectar'),
                    ),
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
