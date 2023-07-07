
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:test_app/globals/entity/user.dart';


part 'user_model.g.dart';

@JsonSerializable()
class UserModel extends UserEntity {
  @JsonKey(defaultValue: 0)
  final int id;
  @JsonKey(defaultValue: '')
  final String email;
  @JsonKey(defaultValue: '')
  final String nickname;

  UserModel({required this.email, required this.nickname, required this.id})
      : super(id: id, name: nickname, email: email);

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
