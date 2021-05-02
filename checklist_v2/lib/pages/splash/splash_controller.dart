import 'dart:io';

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

  Future<bool> verificaConexao() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      await Future.delayed(const Duration(seconds: 2));
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        mensagensCarregando = 'Servidor remoto disponível';
      }
    } on SocketException catch (_) {
      mensagensCarregando = 'Falha ao conectar ao servidor remoto';
      await Future.delayed(const Duration(seconds: 2));
      this.carregarDadosLocais();
      return false;
    }
    this.carregarDadosRemotos();
    return true;
  }

  void _loadFromApi() async {
    var apiProvider = UsuarioApiProvider();

    state = SplashState.loading;
    mensagensCarregando = 'Carregando Usuário';
    await apiProvider.getUsuario();

    // wait for 2 seconds to simulate loading of data
    await Future.delayed(const Duration(seconds: 2));
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
}
