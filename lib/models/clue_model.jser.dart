// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clue_model.dart';

// **************************************************************************
// JaguarSerializerGenerator
// **************************************************************************

abstract class _$ClueModelJsonSerializer implements Serializer<ClueModel> {
  @override
  Map<String, dynamic> toMap(ClueModel model) {
    if (model == null) return null;
    Map<String, dynamic> ret = <String, dynamic>{};
    setMapValue(ret, 'id', model.id);
    setMapValue(ret, 'title', model.title);
    setMapValue(ret, 'order', model.order);
    setMapValue(ret, 'scannedBy', model.scannedBy);
    setMapValue(
        ret, 'scannedOn', dateTimeUtcProcessor.serialize(model.scannedOn));
    return ret;
  }

  @override
  ClueModel fromMap(Map map) {
    if (map == null) return null;
    final obj = ClueModel(
        getJserDefault('id'),
        getJserDefault('title'),
        getJserDefault('order'),
        getJserDefault('scannedBy'),
        getJserDefault('scannedOn'));
    obj.id = map['id'] as int;
    obj.title = map['title'] as String;
    obj.order = map['order'] as int;
    obj.scannedBy = map['scannedBy'] as int;
    obj.scannedOn =
        dateTimeUtcProcessor.deserialize(map['scannedOn'] as String);
    return obj;
  }
}
