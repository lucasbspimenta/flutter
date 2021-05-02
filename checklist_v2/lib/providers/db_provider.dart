import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'package:checklist/core/app_tabelas.dart';

class DBProvider {
  Future<Database> get database async => openDatabase(
        // Set the path to the database. Note: Using the `join` function from the
        // `path` package is best practice to ensure the path is correctly
        // constructed for each platform.
        join(await getDatabasesPath(), 'checklist.db'),
        // When the database is first created, create a table to store dogs.
        onCreate: (Database db, int version) async {
          return criarTabelas(db, version);
        },
        // Set the version. This executes the onCreate function and provides a
        // path to perform database upgrades and downgrades.
        version: 1,
      );

  criarTabelas(Database db, int version) async {
    await db.execute(AppTabelas.usuario);
  }
}

/*
  DBProvider._();
  static final DBProvider db = DBProvider._();
  static Database _database;

  Future<Database> get database async {
    // If database exists, return database
    // ignore: unnecessary_null_comparison
    if (_database != null) return _database;

    // If database don't exists, create one
    _database = await initDB();

    return _database;
  }
  

  // Create the database and the Employee table
  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'checklist.db');

    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute(AppTabelas.usuario);
    });
  }

  // Insert employee on database
  createUsuario(UsuarioModel newEmployee) async {
    await deleteAllUsuarios();
    final db = await database;
    final res = await db.insert('Usuario', newEmployee.toMap());

    return res;
  }

  // Delete all employees
  Future<int> deleteAllUsuarios() async {
    final db = await database;
    final res = await db.rawDelete('DELETE FROM Usuario');

    return res;
  }

  Future<List<UsuarioModel>> getUsuario() async {
    final db = await database;
    final res = await db.rawQuery("SELECT * FROM Usuario LIMIT 1");

    List<UsuarioModel> list =
        res.isNotEmpty ? res.map((c) => UsuarioModel.fromMap(c)).toList() : [];

    return list;
  }*/
