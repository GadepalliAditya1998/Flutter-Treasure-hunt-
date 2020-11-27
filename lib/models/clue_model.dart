import 'package:jaguar_serializer/jaguar_serializer.dart';

part 'clue_model.jser.dart';

class ClueModel {
  int id;
  String title;
  int order;
  int scannedBy;
  DateTime scannedOn;

  ClueModel(this.id, this.title, this.order, this.scannedBy, this.scannedOn);
}

@GenSerializer()
class ClueModelJsonSerializer extends Serializer<ClueModel>
    with _$ClueModelJsonSerializer {}
