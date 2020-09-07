import 'package:fluttercleanarshitecture/feature/Login/data/datasource/auth_datasource.dart';
import 'package:fluttercleanarshitecture/feature/Login/domain/repositories/auth_repository.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart';

class AuthRepositoryImpl extends AuthRepository {
  final _logger = Logger();
  final AuthDataSource _dataSource;

  AuthRepositoryImpl({@required AuthDataSource dataSource})
      : _dataSource = dataSource;

  @override
  Future<bool> hasToken({bool authentication = false}) {
    return _dataSource.hasToken(authentication: authentication);
  }
}
