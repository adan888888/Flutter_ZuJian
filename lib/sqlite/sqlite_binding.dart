import 'package:get/get.dart';

import 'sqlite_logic.dart';

class SqliteBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SqliteLogic>(() => SqliteLogic());
  }
}
