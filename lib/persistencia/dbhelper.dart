import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:path/path.dart';

class DBProvider {
  DBProvider._();
  static final DBProvider db = DBProvider._();

  static Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;

    // if _database is null we instantiate it
    _database = await initDB();
    return _database;
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "myplanningpocker.db");
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute("CREATE TABLE Carta ("
          "id INTEGER PRIMARY KEY,"
          "titulo TEXT,"
          "detalhe TEXT"
          ")");

      await db.execute("CREATE TABLE Configuracoes ("
          "corcarta TEXT,"
          "corfundo TEXT,"
          "corfonte TEXT"
          ")");

      await db
          .rawInsert("INSERT Into Configuracoes (corcarta,corfundo, corfonte)"
              " VALUES ('','','')");
    });
  }
}
