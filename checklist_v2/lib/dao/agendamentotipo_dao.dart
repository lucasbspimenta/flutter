import 'package:checklist/models/agendamentotipo_model.dart';
import 'package:checklist/providers/db_provider.dart';

class AgendamentoTipoDao {
  createAgendamentoTipo(AgendamentoTipoModel agendamentoTipo) async {
    final db = await DBProvider().database;
    await db.insert('AgendamentoTipo', agendamentoTipo.toMap());
    return agendamentoTipo;
  }

  // Delete all employees
  Future<int> deleteAllAgendamentoTipos() async {
    final db = await DBProvider().database;
    final res = await db.rawDelete('DELETE FROM AgendamentoTipo');

    return res;
  }

  Future<List<AgendamentoTipoModel>> getAgendamentoTipos() async {
    final db = await DBProvider().database;
    final res = await db.rawQuery("SELECT * FROM AgendamentoTipo");

    List<AgendamentoTipoModel> list = res.isNotEmpty
        ? res.map((c) => AgendamentoTipoModel.fromMap(c)).toList()
        : [];

    return list;
  }
}
