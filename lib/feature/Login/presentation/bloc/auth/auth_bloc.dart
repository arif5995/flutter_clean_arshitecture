import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttercleanarshitecture/feature/Login/domain/usecase/auth_usecase.dart';
import 'package:fluttercleanarshitecture/feature/Login/presentation/bloc/auth/auth_event.dart';
import 'package:fluttercleanarshitecture/feature/Login/presentation/bloc/auth/auth_state.dart';
import 'package:fluttercleanarshitecture/sevices_locator.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final _logger = Logger();
  final AuthUsecase _authUsecase;

  AuthBloc({
    @required AuthUsecase usecase
  }) : _authUsecase=usecase;

  @override
  AuthState get initialState => throw AuthStateUninitialized();

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    // Event is triggered when the app is started.
    if (event is AuthEventAppStarted) {
      final hasToken = await _authUsecase.hasToken();

      if (hasToken) {
        _logger.d('Authorization token is exist.');
        yield AuthStateAuthorized();
      }
      if (!hasToken) {
        _logger.d('Authorization token doesn\'t exist.');
        yield AuthStateUnauthorized();
      }
    }

    if (event is AuthEventLoggedIn){
      sl<SharedPreferences>().setString('environment', event.environment);
      sl<SharedPreferences>().setString('username', event.username);
      sl<SharedPreferences>().setString('token', event.userInfo['token']);
      yield AuthStateAuthorized();
    }
  }

}