import 'package:checklist/models/resposta_model.dart';
import 'package:checklist/providers/db_provider.dart';

class RespostaDao {
  createResposta(RespostaModel resposta) async {
    final db = await DBProvider().database;
    await db.insert('Resposta', resposta.toMap());
    return resposta;
  }

  // Delete all employees
  Future<int> deleteAllRespostas() async {
    final db = await DBProvider().database;
    final res = await db.rawDelete('DELETE FROM Resposta');

    return res;
  }

  Future<List<RespostaModel>> getResposta() async {
    final db = await DBProvider().database;
    final res = await db.rawQuery("SELECT * FROM Resposta LIMIT 1");

    List<RespostaModel> list =
        res.isNotEmpty ? res.map((c) => RespostaModel.fromMap(c)).toList() : [];

    return list;
  }
}
