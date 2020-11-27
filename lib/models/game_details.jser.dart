// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_details.dart';

// **************************************************************************
// JaguarSerializerGenerator
// **************************************************************************

abstract class _$GameDataModelJsonSerializer
    implements Serializer<GameDataModel> {
  @override
  Map<String, dynamic> toMap(GameDataModel model) {
    if (model == null) return null;
    Map<String, dynamic> ret = <String, dynamic>{};
    setMapValue(ret, 'id', model.id);
    setMapValue(ret, 'name', model.name);
    setMapValue(ret, 'email', model.email);
    setMapValue(ret, 'teamId', model.teamId);
    setMapValue(ret, 'gameId', model.gameId);
    setMapValue(ret, 'gameStatus', model.gameStatus.index);
    return ret;
  }

  @override
  GameDataModel fromMap(Map map) {
    if (map == null) return null;
    final obj = GameDataModel(
        getJserDefault('id'),
        getJserDefault('name'),
        getJserDefault('email'),
        getJserDefault('teamId'),
        getJserDefault('gameStatus'));
    obj.id = map['id'] as int;
    obj.name = map['name'] as String;
    obj.email = map['email'] as String;
    obj.teamId = map['teamId'] as int;
    obj.gameId = map['gameId'] as int;
    obj.gameStatus = GameStatus.values[map['gameStatus'] as int];
    return obj;
  }
}
