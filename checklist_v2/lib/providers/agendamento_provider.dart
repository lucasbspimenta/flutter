import 'package:checklist/core/app_config.dart';
import 'package:checklist/dao/agendamento_dao.dart';
import 'package:checklist/models/agendamento_model.dart';
import 'package:dio/dio.dart';

class AgendamentoApiProvider {
  Future<List<AgendamentoModel?>> getAgendamento() async {
    var url = AppConfig.urlDatabaseString;
    Response response = await Dio().get(url);

    print('Gravando agendamento...');

    return (response.data['agendamentos'] as List).map((agendamento) {
      print('Inserting $agendamento');
      AgendamentoDao().createAgendamento(AgendamentoModel.fromMap(agendamento));
    }).toList();
  }
}
