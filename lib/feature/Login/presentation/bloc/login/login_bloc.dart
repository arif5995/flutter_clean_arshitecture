import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttercleanarshitecture/core/error/common_error.dart';
import 'package:fluttercleanarshitecture/feature/Login/domain/entities/login_response.dart';
import 'package:fluttercleanarshitecture/feature/Login/domain/usecase/auth_usecase.dart';
import 'package:fluttercleanarshitecture/feature/Login/presentation/bloc/auth/bloc.dart';
import 'package:logger/logger.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final _logger = Logger();
  final AuthUsecase _authUsecase;
  final AuthBloc _authBloc;

  LoginBloc({@required AuthBloc authBloc, @required AuthUsecase authUsecase})
      : _authBloc = authBloc,
        _authUsecase = authUsecase;

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is LoginEventFormSubmit) {
      // Event is triggered when submitting the login form.
      yield* _submitForm(event);
    }
  }

  Stream<LoginState> _submitForm(LoginEventFormSubmit event) async* {
    yield LoginStateLoading();
    final loginResponse = await _authUsecase.doLogin(
        username: event.username, password: event.password);

    final result = loginResponse.fold((err) {
      String message;

      if (err is ServerError) {
        message = err.message;
      } else if (err is NoConnectionError) {
        message = err.message;
      }

      _logger.e('Login failed. $message');
      return message;
    }, (data) => data);

    if (result is LoginResponse) {
      yield LoginStateSuccessJDE();
      _authBloc.add(AuthEventLoggedIn(
        username: result.username,
        userInfo: result.userInfo,
        environment: result.environment
      ));
    } else{
      yield LoginStateFailed(message: result);
    }
  }

  @override
  LoginState get initialState => LoginStateInitial();
}
