import 'package:checklist/models/item_model.dart';
import 'package:checklist/providers/db_provider.dart';

class ItemDao {
  createItem(ItemModel item) async {
    final db = await DBProvider().database;
    await db.insert('Item', item.toMap());
    return item;
  }

  // Delete all employees
  Future<int> deleteAllItems() async {
    final db = await DBProvider().database;
    final res = await db.rawDelete('DELETE FROM Item');

    return res;
  }

  Future<List<ItemModel>> getItems() async {
    final db = await DBProvider().database;
    final res = await db.rawQuery("SELECT * FROM Item");

    List<ItemModel> list =
        res.isNotEmpty ? res.map((c) => ItemModel.fromMap(c)).toList() : [];

    return list;
  }
}
