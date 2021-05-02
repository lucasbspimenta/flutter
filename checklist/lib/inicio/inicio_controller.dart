import 'package:checklist/dao/usuario_dao.dart';
import 'package:checklist/models/usuario_model.dart';

class InicioController {
  late UsuarioModel usuario;

  Future<UsuarioModel> _getUsuario(usuarioDao) async {
    return await usuarioDao.first();
  }

  void getUsuario(usuarioDao) async {
    this.usuario = this._getUsuario(usuarioDao) as UsuarioModel;
  }
}
