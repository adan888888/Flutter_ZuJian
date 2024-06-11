
import 'DbHelper.dart';

class BookShelfDbMgr {
  /// 增
  static insert({required BookSelfModel infoModel}) {
    // 去重
    queryAll().then((value) {
      bool isAdd = true;
      for (var data in value) {
        if (data.bookId == infoModel.bookId) {
          isAdd = false;
          break;
        }
      }
      if (isAdd) {
        DbHelper.instance.getDb()?.then((value) => value.insert(
          DbHelper.historyTab,
          infoModel.toJson(),
        ));
      }else {
        deleteAll([infoModel]);
        Future.delayed(const Duration(milliseconds: 200),(){
          insert(infoModel: infoModel);
        });
      }
    });
  }

  /// 删 全部
  static deleteAll(List<BookSelfModel> models) {
    List<String?> ids = List.generate(models.length, (index) => models[index].bookId).toList();

    ids.forEach((element) {
      DbHelper.instance.getDb()?.then((value) => value.delete(
          DbHelper.historyTab,
          where: "bookId = ?",
          whereArgs: [element]
      ));
    });
  }

  /// 更新数据 通过id更新表内具体行的数据
  static update(BookSelfModel readRecordModel) {
    DbHelper.instance.getDb()?.then((value) => value.update(
        DbHelper.historyTab,
        readRecordModel.toJson(),//具体更新的数据
        where: "bookId = ?"//通过id查找需要更新的数据
        ,whereArgs: [readRecordModel.bookId]
    ));
  }

  /// 通过name查具体的实体类
  static Future<BookSelfModel?> getBean(String bookId) async {
    var db = await DbHelper.instance.getDb();
    var maps = await db?.query(DbHelper.historyTab,
        where: 'bookId = ?',//通过实体类中的name字段
        whereArgs: [bookId]);//具体name的值 限定数据
    if(maps!=null && maps.isNotEmpty) {
      return BookSelfModel.fromJson(maps.first);
    }
    return null;
  }

  /// 查 全部all
  static Future<List<BookSelfModel>> queryAll() async {
    List<BookSelfModel> list = [];
    await DbHelper.instance
        .getDb()
        ?.then((db) => db.query(DbHelper.historyTab).then((value) {
      for (var data in value) {
        list.add(BookSelfModel.fromJson(data));
      }
    }));
    return list;
  }
}
class BookSelfModel {
  String? bookId;
  String? bookName;

  BookSelfModel({this.bookId, this.bookName});

  BookSelfModel.fromJson(Map<String, dynamic> json) {
    bookId = json['bookId'];
    bookName = json['bookName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['bookId'] = this.bookId;
    data['bookName'] = this.bookName;
    return data;
  }
}