
import 'package:json_annotation/json_annotation.dart';
part 'signup_request_model.g.dart';

@JsonSerializable()
class SignupRequestModel {
  final String fullName;
  final String email;
  final String password;

  const SignupRequestModel({
    required this.fullName,
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() => _$SignupRequestModelToJson(this);
}
