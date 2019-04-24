import 'dart:async';
import 'package:path/path.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';
import 'package:sol6/utils/storage.dart';

// Future main() async {
//   Database db = await databaseFactoryIo
//       .openDatabase(join(".dart_tool", "sembast", "example", "record_demo.db"));
//   Store store = db.getStore("my_store");
//   Record record = Record(store, {"name": "ugly"});
//   record = await db.putRecord(record);
//   record = await store.getRecord(record.key);
//   record =
//       (await store.findRecords(Finder(filter: Filter.byKey(record.key)))).first;
//   record = await store.getRecord(record.key);
//   print(record);
//   var records =
//       (await store.findRecords(Finder(filter: Filter.matches("name", "^ugl"))));
//   print(records);
// }

class LogDatabase {
  String storeName = 'logs';
  Future<Database> get db async {
    Storage _storage = Storage();
    String path = await _storage.localPath;
    Database db = await databaseFactoryIo.openDatabase('$path/logs.db');
    return db;
  }
  Future<Store> getStore() async {
    final _db = await db;
    return _db.getStore(storeName);
  }
  Future<Record> addRecord(record) async {
    final _rec = Record(await getStore(), record);
    Database _db = await db;
    _db.putRecord(_rec);
    return _rec;
  }
  Future getRecords(limit) async {
    final _store = await getStore();
    return await _store.findRecords(Finder(limit: limit));
  }
}
