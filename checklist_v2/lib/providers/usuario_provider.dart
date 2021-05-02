import 'dart:convert';

import 'package:checklist/core/app_config.dart';
import 'package:checklist/dao/usuario_dao.dart';
import 'package:checklist/models/usuario_model.dart';
import 'package:dio/dio.dart';

class UsuarioApiProvider {
  Future<UsuarioModel> getUsuario() async {
    var url = AppConfig.urlDatabaseString;
    Response response = await Dio().get(url);

    print('Gravando usuário...');

    return await UsuarioDao().createUsuario(
        UsuarioModel.fromJson(jsonEncode(response.data['usuario'])));
  }
}
