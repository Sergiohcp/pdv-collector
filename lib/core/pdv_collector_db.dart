import 'package:mysql_client/mysql_client.dart';

class PdvCollectorDB {
  var conn;

  PdvCollectorDB() {
    this.connect();
  }

  connect() async {
    this.conn = await MySQLConnection.createConnection(
      host: '127.0.0.1',
      port: 3306,
      userName: 'pdv_collector',
      password: 'pdv_collector_wine',
      databaseName: 'pdv_collector_db', // optional,
    );
    await conn.connect();
  }
}

final pdvCollectorDB = PdvCollectorDB();
