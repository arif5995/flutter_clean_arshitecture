import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttercleanarshitecture/feature/Login/data/datasource/auth_datasource.dart';
import 'package:meta/meta.dart';

class AuthDataSourceImp implements AuthDataSource{
  final FlutterSecureStorage secureStorage;

  AuthDataSourceImp({@required this.secureStorage});

  @override
  Future<bool> hasToken({bool authentication = false}) async {
    return await getToken(authentication: authentication) != null;
  }

  @override
  Future<String> getToken({bool authentication = false}) async{
    final String key = 'jwt0';
    return await secureStorage.read(key: key);
  }
  
}