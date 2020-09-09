import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:fluttercleanarshitecture/core/error/common_error.dart';
import 'package:fluttercleanarshitecture/core/error/exception.dart';
import 'package:fluttercleanarshitecture/feature/Login/data/datasource/auth_datasource.dart';
import 'package:fluttercleanarshitecture/feature/Login/data/model/login_parameter_model_jde.dart';
import 'package:fluttercleanarshitecture/feature/Login/domain/entities/login_response.dart';
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

  @override
  Future<Either<CommonError, LoginResponse>> authenticate({String username, String password}) async {
    final loginparameter = LoginParameterModel(username: username, password: password);

    try{
      final result = await _dataSource.authenticate(loginparameter.toJson());
      return Right(result);
    }on DioError catch (e){
      if(e.error is UnauthorizedException) {
        return Left(ClientError(message: 'Invalid username and/or password'));
      } else {
        _logger.e('Error authenticating the user. ${e.message}');
        return Left(ServerError(message: 'Server error when authenticating the user'));
      }

    }catch (e) {
      return Left(UnknownError(message: e.toString()));
    }
  }
}
