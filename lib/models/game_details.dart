import 'package:jaguar_serializer/jaguar_serializer.dart';
import 'package:keka_hunt/enums/game_status.dart';
part 'game_details.jser.dart';

class GameDataModel {
  int id; //User Id
  String name;
  String email;
  int teamId;
  int gameId;
  GameStatus gameStatus;

  GameDataModel(this.id, this.name, this.email, this.teamId, this.gameStatus);
}

@GenSerializer()
class GameDataModelJsonSerializer extends Serializer<GameDataModel>
    with _$GameDataModelJsonSerializer {}
