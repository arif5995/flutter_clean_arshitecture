import 'package:dartz/dartz.dart';
import 'package:fluttercleanarshitecture/core/error/common_error.dart';
import 'package:fluttercleanarshitecture/feature/Login/domain/entities/login_response.dart';
import 'package:meta/meta.dart';

abstract class AuthRepository{
  Future<bool> hasToken({bool authentication = false});

  Future<Either<CommonError, LoginResponse>> authenticate(
    {@required String username, @required String password}
  );
}