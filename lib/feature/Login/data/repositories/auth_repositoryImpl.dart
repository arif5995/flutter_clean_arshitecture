import 'package:fluttercleanarshitecture/feature/Login/domain/repositories/auth_repository.dart';
import 'package:logger/logger.dart';

class AuthRepositoryImpl extends AuthRepository{
  final _logger = Logger();
  @override
  Future<bool> hasToken({bool authentication = false}) {
    // TODO: implement hasToken
    throw UnimplementedError();
  }

}