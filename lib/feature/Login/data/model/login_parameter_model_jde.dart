import 'package:fluttercleanarshitecture/feature/Login/domain/entities/login_parameter.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'login_parameter_model_jde.g.dart';

@JsonSerializable()
class LoginParameterModel extends LoginParameter {
  LoginParameterModel({@required String username, @required String password})
      : super(username: username, password: password);

  factory LoginParameterModel.fromJson(Map<String, dynamic> json) =>
      _$LoginParameterModelFromJson(json);
  Map<String, dynamic> toJson() => _$LoginParameterModelToJson(this);
}