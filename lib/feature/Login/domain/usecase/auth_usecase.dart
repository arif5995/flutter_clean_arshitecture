import 'package:fluttercleanarshitecture/feature/Login/domain/repositories/auth_repository.dart';

class AuthUsecase{
  final AuthRepository authRepository;

  AuthUsecase(this.authRepository);

  Future<bool> hasToken({bool authentification = false}){
    return authRepository.hasToken(authentication: authentification);
  }

}