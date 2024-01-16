import 'package:json_annotation/json_annotation.dart';

part 'loginInfo.g.dart';

@JsonSerializable()
class LoginRequest {
  String? user;
  String? password;
  LoginRequest({
    this.user,
    this.password,
  });
  factory LoginRequest.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestFromJson(json);
  Map<String, dynamic> toJson() => _$LoginRequestToJson(this);
}
