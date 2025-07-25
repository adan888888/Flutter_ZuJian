import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'sqlite_state.dart';

class SqliteLogic extends GetxController {
  final SqliteState state = SqliteState();
  late Database database;

  @override
  Future<void> onInit() async {
    super.onInit();
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'demo.db');
    print('测试=》$path');
    database = await openDatabase(path, version: 1, onCreate: (Database db, int version) async {
      await db.execute('CREATE TABLE Test (id INTEGER PRIMARY KEY, name TEXT, value INTEGER, num REAL)');
    });
  }

  //查
  queryAll(Function(List<Map>) callback) async {
    var list = await database.rawQuery('SELECT * FROM Test');
    state.list.clear();
    state.list.addAll(list);
    callback(list);
  }

  //增
  add() async {
    await database.transaction((txn) async {
      int id2 = await txn.rawInsert('INSERT INTO Test(name, value, num) VALUES(?, ?, ?)', ['another name', 12345678, 3.1416]);
      queryAll((p0) => null);
    });
  }

  //删
  delete() async {
    await database.transaction((txn) async {
      await txn.rawDelete('DELETE FROM Test WHERE id IN ( SELECT id FROM Test ORDER BY id DESC LIMIT 1)');
      queryAll((p0) => null);
    });
  }
}
