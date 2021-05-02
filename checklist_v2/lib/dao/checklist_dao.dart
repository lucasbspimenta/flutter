import 'package:checklist/models/checklist_model.dart';
import 'package:checklist/providers/db_provider.dart';

class ChecklistDao {
  createChecklist(ChecklistModel checklist) async {
    final db = await DBProvider().database;
    await db.insert('Checklist', checklist.toMap());
    return checklist;
  }

  // Delete all employees
  Future<int> deleteAllChecklists() async {
    final db = await DBProvider().database;
    final res = await db.rawDelete('DELETE FROM Checklist');

    return res;
  }

  Future<List<ChecklistModel>> getChecklist() async {
    final db = await DBProvider().database;
    final res = await db.rawQuery("SELECT * FROM Checklist");

    List<ChecklistModel> list = res.isNotEmpty
        ? res.map((c) => ChecklistModel.fromMap(c)).toList()
        : [];

    return list;
  }
}
