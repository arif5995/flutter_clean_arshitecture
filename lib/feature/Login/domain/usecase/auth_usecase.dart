import 'package:fluttercleanarshitecture/core/error/common_error.dart';
import 'package:fluttercleanarshitecture/feature/Login/domain/entities/login_response.dart';
import 'package:fluttercleanarshitecture/feature/Login/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

class AuthUsecase{
  final AuthRepository authRepository;

  AuthUsecase(this.authRepository);

  Future<bool> hasToken({bool authentification = false}){
    return authRepository.hasToken(authentication: authentification);
  }

  Future<Either<CommonError, LoginResponse>> doLogin(
    {@required String username, @required String password}) async {
     return authRepository.authenticate(username: username, password: password);
    }
}