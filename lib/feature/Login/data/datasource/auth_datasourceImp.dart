import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttercleanarshitecture/feature/Login/data/datasource/auth_datasource.dart';
import 'package:fluttercleanarshitecture/feature/Login/data/model/login_parameter_model_jde.dart';
import 'package:fluttercleanarshitecture/feature/Login/data/model/login_response_model.dart';
import 'package:fluttercleanarshitecture/feature/Login/domain/entities/login_response.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart';

class AuthDataSourceImp implements AuthDataSource{
  final _logger = Logger();
  final Dio dio;
  final FlutterSecureStorage secureStorage;

  AuthDataSourceImp({@required this.dio, @required this.secureStorage});

  @override
  Future<bool> hasToken({bool authentication = false}) async {
    return await getToken(authentication: authentication) != null;
  }

  @override
  Future<String> getToken({bool authentication = false}) async{
    final String key = 'jwt0';
    return await secureStorage.read(key: key);
  }

  @override
  Future<void> storeAuthenticationDetails({String username, String password, String token}) async {
    await secureStorage.write(key: 'jwt0', value: token);

    await secureStorage.write(key: 'username', value: username);

    await secureStorage.write(key: 'password', value: password);
  }

  @override
  Future<LoginResponse> authenticate(Map<String, dynamic> loginParam) async {
    try{
      final response = await dio.post('http://36.37.92.3:9281/jderest/v2/tokenrequest', data: loginParam);
      print('Api $response');
      if(response.statusCode == 200) {

        final data = LoginResponseModel.fromJson(response.data);
        final param = LoginParameterModel.fromJson(loginParam);

        await storeAuthenticationDetails(
            token: data.userInfo['token'],
            password: param.password,
            username: param.username
        );
        print("data: $data");
        return data;

      }
    } on DioError catch (e){
        throw e;
    }

      throw null;
  }
  
}