import 'package:jaguar_serializer/jaguar_serializer.dart';
import 'package:keka_hunt/models/clue_model.dart';
part 'clue_model_list.jser.dart';

class ClueListModel {
  List<ClueModel> clueModelList;

  ClueListModel(this.clueModelList);
}

@GenSerializer()
class ClueListModelJsonSerializer
    extends Serializer<ClueListModelJsonSerializer>
    with _$ClueListModelJsonSerializer {}
