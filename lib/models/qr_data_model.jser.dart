// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'qr_data_model.dart';

// **************************************************************************
// JaguarSerializerGenerator
// **************************************************************************

abstract class _$QRDataModelJsonSerializer implements Serializer<QRDataModel> {
  @override
  Map<String, dynamic> toMap(QRDataModel model) {
    if (model == null) return null;
    Map<String, dynamic> ret = <String, dynamic>{};
    setMapValue(ret, 'clueNumber', model.clueNumber);
    setMapValue(ret, 'teamId', model.teamId);
    setMapValue(ret, 'clueId', model.clueId);
    return ret;
  }

  @override
  QRDataModel fromMap(Map map) {
    if (map == null) return null;
    final obj = QRDataModel();
    obj.clueNumber = map['clueNumber'] as int;
    obj.teamId = map['teamId'] as int;
    obj.clueId = map['clueId'] as int;
    return obj;
  }
}
