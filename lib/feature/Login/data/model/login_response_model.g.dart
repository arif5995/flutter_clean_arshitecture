// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponseModel _$LoginResponseModelFromJson(Map<String, dynamic> json) {
  return LoginResponseModel(
    username: json['username'] as String,
    userInfo: json['userInfo'] as Map<String, dynamic>,
    environment: json['environment'] as String,
  );
}

Map<String, dynamic> _$LoginResponseModelToJson(LoginResponseModel instance) =>
    <String, dynamic>{
      'username': instance.username,
      'userInfo': instance.userInfo,
      'environment': instance.environment,
    };
