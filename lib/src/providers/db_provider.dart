import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'package:qr_reader/src/models/scan_model.dart';
export 'package:qr_reader/src/models/scan_model.dart';

class DBProvider {
  static Database _database;

  static final DBProvider db = DBProvider._();

  //Private constructor
  DBProvider._();

  Future<Database> get database async {
    if (_database != null) return _database;

    _database = await initDB();

    return _database;
  }

  Future<Database> initDB() async {
    //Path database

    Directory documentsDirectory = await getApplicationDocumentsDirectory();

    final path = join(documentsDirectory.path, 'ScansDB.db');

    print(path);

    //create DB

    return await openDatabase(
      path,
      version: 1,
      onOpen: (db) {},
      onCreate: (Database db, int version) async {
        await db.execute('''
          CREATE TABLE Scans(
            id INTEGER PRIMARY KEY,
            type TEXT,
            value TEXT
          )
        ''');
      },
    );
  }

  //Method One to insert data to DB
  // Future<int> newScanRaw( ScanModel newScan) async {

  //   final id = newScan.id;
  //   final type = newScan.type;
  //   final value = newScan.value;

  //   //Verify database
  //   final db = await database;

  //   final res = await db.rawInsert('''
  //     INSERT INTO Scans( id, type, value){
  //       VALUES( $id, '$type', '$value')
  //     }
  //   ''');

  //   return res;
  // }

  //Method Two to insert data to DB
  Future<int> newScan(ScanModel newScan) async {
    //Verify database
    final db = await database;

    //returns Id of last inserted registry
    final res = await db.insert('Scans', newScan.toJson());

    return res;
  }

  Future<ScanModel> getScanById(int id) async {
    final db = await database;

    final res = await db.query('Scans', where: 'id=?', whereArgs: [id]);

    return res.isNotEmpty ? ScanModel.fromJson(res.first) : null;
  }

  Future<List<ScanModel>> getAllScan() async {
    final db = await database;

    final res = await db.query('Scans');

    return res.isNotEmpty ? res.map((scan) => ScanModel.fromJson(scan)).toList()
    : [];
  }


  Future<List<ScanModel>> getScansByType(String type) async {
    final db = await database;

    final res = await db.query('Scans', where: 'type=?', whereArgs: [type]);

    return res.isNotEmpty ? res.map((scan) => ScanModel.fromJson(scan)).toList()
    : [];
  }
}
