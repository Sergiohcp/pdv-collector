import 'package:get/get.dart';
import 'package:mysql_client/mysql_client.dart';
import 'package:pdv_collector/utils/toaster.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DBController {
  var _isConnectLoading = false.obs;
  var db = null;

  DBController();

  bool get isConnectLoading => _isConnectLoading.value;

  void setConnectLoading(bool value) {
    _isConnectLoading.value = value;
  }

  Future save(
      String host, String user, String password, String database) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('host', host);
    await prefs.setString('user', user);
    await prefs.setString('password', password);
    await prefs.setString('database', database);
  }

  Future connect(
      String host, String user, String password, String database) async {
    try {
      setConnectLoading(true);
      final conn = await MySQLConnection.createConnection(
        host: host,
        port: 3306,
        userName: user,
        password: password,
        databaseName: database,
      );
      await conn.connect();
      await this.save(host, user, password, database);
      this.db = conn;
      Get.offAllNamed('/Orders');
    } catch (error) {
      showToaster(title: "Erro", message: "Não foi possível concetar ao banco");
      Get.offAllNamed('/DB');
    } finally {
      setConnectLoading(false);
    }
  }

  disconnect() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('host');
    await prefs.remove('user');
    await prefs.remove('password');
    await prefs.remove('database');
    Get.offNamed('/DB');
  }
}
