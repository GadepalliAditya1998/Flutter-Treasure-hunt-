import 'package:jaguar_serializer/jaguar_serializer.dart';
part 'qr_data_model.jser.dart';

class QRDataModel {
  int clueNumber;
  int teamId;
  int clueId;
}

@GenSerializer()
class QRDataModelJsonSerializer extends Serializer<QRDataModel>
    with _$QRDataModelJsonSerializer {}
