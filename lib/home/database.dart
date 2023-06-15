import 'dart:io';
import 'package:apk_23/home/form_models.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class Databaseinstace {
  final String _databaseName = 'my_database.db';
  final int _databaseVersion = 1;

  // Table Form
  final String table = 'form';
  final String id = 'id';
  final String namadepan = 'namadepan';
  final String namabelakang = 'namabelakang';
  final String nohp = 'nohp';
  final String gender = 'gender';
  final String jenjang = 'jenjang';
  final String hobi = 'hobi';
  final String alamat = 'alamat';

  Database? _database;
  Future<Database> database() async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return openDatabase(path, version: _databaseVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute(
        'CREATE TABLE $table ($id INTEGER PRIMARY KEY, $namadepan TEXT NULL, $namabelakang TEXT NULL, $nohp TEXT NULL,$gender TEXT NULL,$jenjang TEXT NULL,$hobi TEXT NULL, $alamat TEXT NULL)');
  }

  Future<List<FormModel>> all() async {
    if (_database == null) {
      _database = await database();
    }
    final data = await _database!.query(table);
    List<FormModel> result = data.map((e) => FormModel.formJson(e)).toList();
    return result;
  }

  Future<int> insert(Map<String, dynamic> row) async {
    if (_database == null) {
      _database = await database();
    }
    final query = await _database!.insert(table, row);
    return query;
  }

  Future<int> update(int idUpdate, Map<String, dynamic> row) async {
    if (_database == null) {
      _database = await database();
    }
    final query = await _database!
        .update(table, row, where: '$id = ?', whereArgs: [idUpdate]);
    return query;
  }

  Future delete(int idUpdate) async {
    await _database!.delete(table, where: '$id = ?', whereArgs: [idUpdate]);
  }

  Future<List<FormModel>> search(String searchText) async {
    if (_database == null) {
      _database = await database();
    }

    final data = await _database!.query(
      table,
      where: '$namadepan LIKE ? OR $namabelakang LIKE ?',
      whereArgs: ['%$searchText%', '%$searchText%'],
    );

    List<FormModel> result = data.map((e) => FormModel.formJson(e)).toList();
    return result;
  }
}
