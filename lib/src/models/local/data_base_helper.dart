import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();

  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('photo_albums.db');
    return _database!;
  }

  Future<Database> _initDB(String fileName) async {
    final dir = await getApplicationDocumentsDirectory();
    final path = join(dir.path, fileName);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE photos (
        id INTEGER PRIMARY KEY,
        title TEXT,
        url TEXT,
        thumbnailUrl TEXT,
        albumId INTEGER
      )
    ''');

    // Crie também tabelas para albums, comments, users conforme seu modelo
  }

  // Métodos para inserir, buscar, deletar dados podem ser adicionados aqui

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
