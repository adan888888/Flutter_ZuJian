import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'sqlite_logic.dart';
import 'package:sqflite/sqflite.dart';

class SqliteView extends StatelessWidget {
  const SqliteView({super.key});

  @override
  Widget build(BuildContext context) {
    final logic = Get.find<SqliteLogic>();
    final state = Get.find<SqliteLogic>().state;

    return Scaffold(
      appBar: AppBar(
        title: Text('sqlite'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Row(
            children: [
              ElevatedButton(
                  onPressed: () {
                    logic.queryAll((List<Map> list) {
                      print('测试=》$list');
                    });
                  },
                  child: Text("查询")),
              ElevatedButton(
                  onPressed: () {
                    logic.add();
                  },
                  child: Text("增加")),
            ],
          ),
          Flexible(child: Obx(() {
            return ListView.separated(
                itemBuilder: (context, index) {
                  Text("${state.list}");
                },
                separatorBuilder: (b, index) => Divider(height: 1, color: Colors.red),
                itemCount: state.list.length);
          }))
        ],
      ),
    );
  }

  testSqlite() async {
    int count = 0;

    // var db = await openDatabase('my_db.db');
    // Get a location using getDatabasesPath
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'demo.db');

    // Delete the database
    // await deleteDatabase(path);

    Database database = await openDatabase(path, version: 1, onCreate: (Database db, int version) async {
      // When creating the db, create the table
      await db.execute('CREATE TABLE Test (id INTEGER PRIMARY KEY, name TEXT, value INTEGER, num REAL)');
    });

    // Insert some records in a transaction
    await database.transaction((txn) async {
      int id1 = await txn.rawInsert('INSERT INTO Test(name, value, num) VALUES("some name", 1234, 456.789)');
      print('inserted1: $id1');
      int id2 = await txn.rawInsert('INSERT INTO Test(name, value, num) VALUES(?, ?, ?)', ['another name', 12345678, 3.1416]);
      print('inserted2: $id2');
    });

    count = await database.rawDelete('DELETE FROM Test WHERE name = ?', ['another name']);
    print(count);
    count = await database.rawDelete('DELETE FROM Test WHERE name = ?', ['some name']);
    print(count);

    List<Map> list = await database.rawQuery('SELECT * FROM Test');
    print(list);

    count = await database.rawUpdate('UPDATE Test SET name = ?, value = ? WHERE name = ?', ['updated name', '9876', 'some name']);
    print('updated: $count');
  }
}
