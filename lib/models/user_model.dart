import 'package:jaguar_serializer/jaguar_serializer.dart';

part 'user_model.jser.dart';

class UserModel {
  String name;
  String email;
  int teamPin;

  UserModel(this.name, this.email, this.teamPin);
}

@GenSerializer()
class UserModelJsonSerializer extends Serializer<UserModel>
    with _$UserModelJsonSerializer {}
