// database.dart

// required package imports
import 'dart:async';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import 'dao/usuario_dao.dart';
import 'models/usuario_model.dart';

part 'database.g.dart'; // the generated code will be there

@Database(version: 1, entities: [UsuarioModel])
abstract class AppDatabase extends FloorDatabase {
  UsuarioDao get usuarioDao;
}
