import 'package:checklist/core/app_config.dart';
import 'package:checklist/dao/agendamentotipo_dao.dart';
import 'package:checklist/models/agendamentotipo_model.dart';
import 'package:dio/dio.dart';

class AgendamentoTipoApiProvider {
  Future<List<AgendamentoTipoModel?>> getAgendamentoTipo() async {
    var url = AppConfig.urlDatabaseString;
    Response response = await Dio().get(url);

    print('Gravando agendamento tipos...');

    return (response.data['agendamento_tipos'] as List).map((agendamentotipo) {
      print('Inserting $agendamentotipo');
      AgendamentoTipoDao()
          .createAgendamentoTipo(AgendamentoTipoModel.fromMap(agendamentotipo));
    }).toList();
  }
}
