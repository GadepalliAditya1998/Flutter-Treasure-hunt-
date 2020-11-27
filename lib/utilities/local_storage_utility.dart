import 'dart:convert';

import 'package:keka_hunt/models/game_details.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageUtility {
  SharedPreferences prefs;
  GameDataModelJsonSerializer _serializer = GameDataModelJsonSerializer();

  Future<GameDataModel> getGameDataModel() async {
    prefs = await SharedPreferences.getInstance();
    String data = prefs.getString("gameData");

    try {
      Map map = jsonDecode(data) as Map;
      print(map);
      return _serializer.fromMap(map);
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<bool> setGameDataModel(GameDataModel gameDataModel) async {
    prefs = await SharedPreferences.getInstance();

    if (gameDataModel != null) {
      String data = jsonEncode(_serializer.toMap(gameDataModel));
      print(data);
      if (data != null) return prefs.setString("gameData", data);
    }
    return false;
  }
}
