import 'package:checklist/models/usuario_model.dart';
import 'package:floor/floor.dart';

@dao
abstract class UsuarioDao {
  @Query('SELECT * FROM Usuario LIMIT 1')
  Future<UsuarioModel?> first();

  @Query('SELECT * FROM Usuario')
  Future<List<UsuarioModel>> all();

  @Query('SELECT * FROM Usuario WHERE matricula = :matricula')
  Stream<UsuarioModel?> find(int matricula);

  @insert
  Future<void> insertUsuario(UsuarioModel usuario);
}
