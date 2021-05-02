import 'package:checklist/models/usuario_model.dart';
import 'package:checklist/providers/db_provider.dart';

class UsuarioDao {
  createUsuario(UsuarioModel usuario) async {
    await deleteAllUsuarios();
    final db = await DBProvider().database;
    await db.insert('Usuario', usuario.toMap());
    return usuario;
  }

  // Delete all employees
  Future<int> deleteAllUsuarios() async {
    final db = await DBProvider().database;
    final res = await db.rawDelete('DELETE FROM Usuario');

    return res;
  }

  Future<List<UsuarioModel>> getUsuario() async {
    final db = await DBProvider().database;
    final res = await db.rawQuery("SELECT * FROM Usuario LIMIT 1");

    List<UsuarioModel> list =
        res.isNotEmpty ? res.map((c) => UsuarioModel.fromMap(c)).toList() : [];

    return list;
  }
}
