import 'dart:convert';
import 'package:checklist/models/agendamentotipo_model.dart';
import 'package:checklist/models/usuario_model.dart';

import '../database.dart';

class AppRepository {
  set baseLocal(AppDatabase baseLocal) => this.baseLocal = baseLocal;
  AppDatabase get baseLocal => this.baseLocal;

  AppRepository() {
    $FloorAppDatabase
        .databaseBuilder('checklist_database.db')
        .build()
        .then((value) async => this.baseLocal = value);
  }

  Future<UsuarioModel> getUsuario(response) async {
    final user = UsuarioModel.fromJson(response.toString());
    return user;
  }

  Future<List<AgendamentoTipoModel>> getAgendamentoTipos(response) async {
    final list = jsonDecode(response) as List;
    final agendamentoTipos =
        list.map((e) => AgendamentoTipoModel.fromMap(e)).toList();
    return agendamentoTipos;
  }
}
