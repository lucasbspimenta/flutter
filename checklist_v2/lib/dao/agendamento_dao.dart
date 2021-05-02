import 'package:checklist/models/agendamento_model.dart';
import 'package:checklist/providers/db_provider.dart';

class AgendamentoDao {
  createAgendamento(AgendamentoModel agendamento) async {
    final db = await DBProvider().database;
    await db.insert('Agendamento', agendamento.toMap());
    return agendamento;
  }

  // Delete all employees
  Future<int> deleteAllAgendamentos() async {
    final db = await DBProvider().database;
    final res = await db.rawDelete('DELETE FROM Agendamento');

    return res;
  }

  Future<List<AgendamentoModel>> getAgendamento() async {
    final db = await DBProvider().database;
    final res = await db.rawQuery("SELECT * FROM Agendamento");

    List<AgendamentoModel> list = res.isNotEmpty
        ? res.map((c) => AgendamentoModel.fromMap(c)).toList()
        : [];

    return list;
  }
}
