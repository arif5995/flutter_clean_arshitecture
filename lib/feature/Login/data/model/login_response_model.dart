import 'package:fluttercleanarshitecture/feature/Login/domain/entities/login_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_response_model.g.dart';

@JsonSerializable(explicitToJson: true)
class LoginResponseModel extends LoginResponse{
  LoginResponseModel(
      {
        //JDE Config
        // List<SimpleListItemModel> clients,
        // @required String token
        String username,
        Map<String, dynamic> userInfo,
        String environment})
      : super(username: username, userInfo: userInfo, environment: environment);

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$LoginResponseModelToJson(this);
}