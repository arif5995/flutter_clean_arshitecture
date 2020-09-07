// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_parameter_model_jde.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginParameterModel _$LoginParameterModelFromJson(Map<String, dynamic> json) {
  return LoginParameterModel(
    username: json['username'] as String,
    password: json['password'] as String,
  );
}

Map<String, dynamic> _$LoginParameterModelToJson(
        LoginParameterModel instance) =>
    <String, dynamic>{
      'username': instance.username,
      'password': instance.password,
    };
