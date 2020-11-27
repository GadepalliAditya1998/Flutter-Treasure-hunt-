// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JaguarSerializerGenerator
// **************************************************************************

abstract class _$UserModelJsonSerializer implements Serializer<UserModel> {
  @override
  Map<String, dynamic> toMap(UserModel model) {
    if (model == null) return null;
    Map<String, dynamic> ret = <String, dynamic>{};
    setMapValue(ret, 'name', model.name);
    setMapValue(ret, 'email', model.email);
    setMapValue(ret, 'teamPin', model.teamPin);
    return ret;
  }

  @override
  UserModel fromMap(Map map) {
    if (map == null) return null;
    final obj = UserModel(getJserDefault('name'), getJserDefault('email'),
        getJserDefault('teamPin'));
    obj.name = map['name'] as String;
    obj.email = map['email'] as String;
    obj.teamPin = map['teamPin'] as int;
    return obj;
  }
}
