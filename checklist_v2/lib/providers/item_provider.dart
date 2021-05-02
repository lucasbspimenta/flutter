import 'package:checklist/core/app_config.dart';
import 'package:checklist/dao/item_dao.dart';
import 'package:checklist/models/item_model.dart';
import 'package:dio/dio.dart';

class ItemApiProvider {
  Future<List<ItemModel?>> getItem() async {
    var url = AppConfig.urlDatabaseString;
    Response response = await Dio().get(url);

    print('Gravando item...');

    return (response.data['itens'] as List).map((item) {
      print('Inserting $item');
      ItemDao().createItem(ItemModel.fromMap(item));
    }).toList();
  }
}
