import 'dart:convert';

import 'package:checklist/core/app_config.dart';
import 'package:checklist/database.dart';
import 'package:checklist/models/agendamentotipo_model.dart';
import 'package:checklist/models/usuario_model.dart';
import 'package:checklist/repository/app_repository.dart';
import 'package:flutter/foundation.dart';

import 'package:permission_handler/permission_handler.dart';
import 'package:http/http.dart' as http;

import 'splash_state.dart';

class SplashController {
  final stateNotifier = ValueNotifier<SplashState>(SplashState.empty);
  set state(SplashState state) => stateNotifier.value = state;
  SplashState get state => stateNotifier.value;

  final mensagensCarregandoNotifier = ValueNotifier<String>('Carregando...');
  set mensagensCarregando(String mensagensCarregando) =>
      mensagensCarregandoNotifier.value = mensagensCarregando;
  String get mensagensCarregando => mensagensCarregandoNotifier.value;

  AppDatabase? database;
  UsuarioModel? usuario;
  List<AgendamentoTipoModel>? agendamentoTipos;

  final repository = AppRepository();

  void getUsuario(response) async {
    state = SplashState.loading;
    mensagensCarregando = 'Carregando Usuário';
    usuario = await repository.getUsuario(response);
    mensagensCarregando = 'Carregando Usuário: Concluído';
    state = SplashState.success;
  }

  void getAgendamentoTipos(response) async {
    state = SplashState.loading;
    mensagensCarregando = 'Carregando Tipos de Agendamentos';
    agendamentoTipos = await repository.getAgendamentoTipos(response);
    mensagensCarregando = 'Carregando Tipos de Agendamentos: Concluído';
    state = SplashState.success;
  }

  void getPermissoes() async {
    state = SplashState.loading;
    mensagensCarregando = 'Verificando permissões';
    Map<Permission, PermissionStatus> statuses = await [
      Permission.camera,
      Permission.storage,
    ].request();
    state = SplashState.success;
    mensagensCarregando = 'Verificando permissões: Concluído';
    debugPrint(statuses.toString());
  }

  void carregaDadosRemotos(json) async {
    this.getUsuario(jsonEncode(json['usuario']));
    this.getAgendamentoTipos(jsonEncode(json['agendamento_tipos']));
  }

  void getDatabaseRemota() async {
    state = SplashState.loading;
    mensagensCarregando = 'Carregando database remota';

    final response = await http.get(AppConfig.urlDatabase);

    if (response.statusCode == 200) {
      state = SplashState.success;
      mensagensCarregando = 'Verificando database: Concluído';
      this.carregaDadosRemotos(jsonDecode(response.body));
    } else {
      mensagensCarregando = 'Falha ao carregar database remota';
      throw Exception('Falha ao carregar database remota');
    }
  }

  Future<bool> getDatabase() async {
    repository.iniciarBaseLocal();
    return true;
  }
}
