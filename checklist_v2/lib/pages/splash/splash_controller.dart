import 'dart:io';

import 'package:checklist/core/app_config.dart';
import 'package:checklist/providers/agendamento_provider.dart';
import 'package:checklist/providers/agendamentotipo_provider.dart';
import 'package:checklist/providers/item_provider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:checklist/pages/splash/splash_state.dart';
import 'package:checklist/providers/usuario_provider.dart';

class SplashController {
  final stateNotifier = ValueNotifier<SplashState>(SplashState.loading);
  set state(SplashState state) => stateNotifier.value = state;
  SplashState get state => stateNotifier.value;

  final mensagensCarregandoNotifier = ValueNotifier<String>('Carregando...');
  set mensagensCarregando(String mensagensCarregando) =>
      mensagensCarregandoNotifier.value = mensagensCarregando;
  String get mensagensCarregando => mensagensCarregandoNotifier.value;

  void carregaDados() async {
    try {
      this.verificaConexao();
      state = SplashState.success;
    } catch (e) {
      state = SplashState.error;
      mensagensCarregando = 'Erro ao carregar dados';
    }
  }

  Future<bool> verificaConexao() async {
    Response response = await Dio().head(AppConfig.urlDatabaseString);

    if (response.statusCode == 200) {
      mensagensCarregando = 'Servidor remoto disponível';
    } else {
      mensagensCarregando = 'Falha ao conectar ao servidor remoto';
      this.carregarDadosLocais();
      return false;
    }
    this.carregarDadosRemotos();
    return true;
  }

  void _loadFromApi() async {
    this._loadUsuarioFromApi();
    this._loadAgendamentoTiposFromApi();
    this._loadAgendamentosFromApi();
    this._loadItemsFromApi();
  }

  void carregarDadosRemotos() async {
    mensagensCarregando = 'Carregando dados remotos';
    this._loadFromApi();
    this.carregarDadosLocais();
  }

  void carregarDadosLocais() async {
    mensagensCarregando = 'Carregando dados locais';
    await Future.delayed(const Duration(seconds: 2));
  }

  void _loadUsuarioFromApi() async {
    var apiProvider = UsuarioApiProvider();

    state = SplashState.loading;
    mensagensCarregando = 'Carregando Usuário';
    await apiProvider.getUsuario();
  }

  void _loadAgendamentoTiposFromApi() async {
    var apiProvider = AgendamentoTipoApiProvider();

    state = SplashState.loading;
    mensagensCarregando = 'Carregando Tipos de Agendamento';
    await apiProvider.getAgendamentoTipo();
  }

  void _loadAgendamentosFromApi() async {
    var apiProvider = AgendamentoApiProvider();

    state = SplashState.loading;
    mensagensCarregando = 'Carregando Agendamentos';
    await apiProvider.getAgendamento();
  }

  void _loadItemsFromApi() async {
    var apiProvider = ItemApiProvider();

    state = SplashState.loading;
    mensagensCarregando = 'Carregando Itens do Checklist';
    await apiProvider.getItem();
  }
}
