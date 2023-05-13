import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DataBase{

  static Database? _db;

  Future<Database?> get db async{
    if(_db ==null){
      _db = await initDataBase();
      return _db;
    }else{
      return _db;
    }
  }

  initDataBase() async{
    String dataBasePath = await getDatabasesPath();
    String path = join(dataBasePath, 'local.db');
    Database localdb = await openDatabase(path, onCreate: _onCreate, version: 1, onUpgrade: _onUpgrade);
    return localdb;
  }
  _onUpgrade(Database db, int oldVersion, int newVersion) async{

  }
  _onCreate(Database db, int version) async{
    await db.execute('''
    CREATE TABLE "user" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "password" VARCHAR NOT NULL ,
    "login" VARCHAR NOT NULL ,
    "role" VARCHAR NOT NULL
    )
    ''');

    await db.execute('''
    CREATE TABLE "order" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "numberOrder" VARCHAR NOT NULL,
    "dataTime" DATETIME NOT NULL ,
    "initiator" VARCHAR NOT NULL ,
    "organization" VARCHAR NOT NULL,
    "service" VARCHAR NOT NULL,
    "compositionService" VARCHAR NOT NULL,
    "application" VARCHAR NOT NULL,
    "description" VARCHAR NOT NULL,
    "solution" VARCHAR NOT NULL,
    "status" VARCHAR NOT NULL,
    "executionStatus" VARCHAR NOT NULL,
    "priority" VARCHAR NOT NULL,
    "linked" BOOLEAN NOT NULL
    )
    ''');

    await db.execute('''
    CREATE TABLE "request" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "numberRequest" VARCHAR NOT NULL,
    "dataTime" DATETIME NOT NULL ,
    "initiator" VARCHAR NOT NULL ,
    "organization" VARCHAR NOT NULL,
    "service" VARCHAR NOT NULL,
    "compositionService" VARCHAR NOT NULL,
    "application" VARCHAR NOT NULL,
    "description" VARCHAR NOT NULL,
    "status" VARCHAR NOT NULL,
    "post" VARCHAR NOT NULL,
    "priority" VARCHAR NOT NULL,
    "linked" BOOLEAN NOT NULL
    )
    ''');

    await db.execute('''
    CREATE TABLE "approval" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "numberApproval" VARCHAR NOT NULL,
    "dataTime" DATETIME NOT NULL ,
    "initiator" VARCHAR NOT NULL ,
    "organization" VARCHAR NOT NULL,
    "application" VARCHAR NOT NULL,
    "description" VARCHAR NOT NULL,
    "approvalStatus" VARCHAR NOT NULL,
    "comment" VARCHAR NOT NULL,
    "linked" BOOLEAN NOT NULL
    )
    ''');

    await db.execute('''
    CREATE TABLE "linkedDocuments" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "typeDocument" VARCHAR NOT NULL ,
    "numberDocument" VARCHAR NOT NULL ,
    "typeLinkedDocument" VARCHAR NOT NULL ,
    "numberLinkedDocument" VARCHAR NOT NULL
    )
    ''');

    await db.execute('''
    CREATE TABLE "file" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" VARCHAR NOT NULL ,
    "location" VARCHAR NOT NULL ,
    "typeDocument" VARCHAR NOT NULL,
    "numberDocument" VARCHAR NOT NULL
    )
    ''');
    print("создана база данных и таблица пользователей ==========================");
  }

  readData(String sql) async{
    Database? localdb = await db;
    List<Map> response = await localdb!.rawQuery(sql);
    return response;
  }

  insertData(String sql) async{
    Database? localdb = await db;
    int response = await localdb!.rawInsert(sql);
    return response;
  }

  updateData(String sql) async{
    Database? localdb = await db;
    int response = await localdb!.rawUpdate(sql);
    return response;
  }

  deleteData(String sql) async{
    Database? localdb = await db;
    int response = await localdb!.rawDelete(sql);
    return response;
  }

  deleteDataBase() async{
    String dataBasePath = await getDatabasesPath();
    String path = join(dataBasePath, 'local.db');
    await deleteDatabase(path);
  }


  read(String table) async{
    Database? localdb = await db;
    List<Map> response = await localdb!.query(table);
    return response;
  }

  insert(String table, Map<String, Object?> values) async{
    Database? localdb = await db;
    int response = await localdb!.insert(table, values);
    return response;
  }

  update(String table, Map<String, Object?> values, String? myWhere) async{
    Database? localdb = await db;
    int response = await localdb!.update(table, values, where: myWhere);
    return response;
  }

  delete(String table, String? myWhere) async{
    Database? localdb = await db;
    int response = await localdb!.delete(table,  where: myWhere);
    return response;
  }
}

