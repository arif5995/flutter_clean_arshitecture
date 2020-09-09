import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttercleanarshitecture/feature/Login/domain/usecase/auth_usecase.dart';
import 'package:fluttercleanarshitecture/feature/Login/presentation/bloc/login/login_bloc.dart';
import 'package:fluttercleanarshitecture/feature/Login/presentation/page/login_page.dart';
import 'package:fluttercleanarshitecture/feature/Splash/presentation/page/splash_page.dart';
import 'package:fluttercleanarshitecture/sevices_locator.dart';
import 'package:logger/logger.dart';

import 'feature/Login/presentation/bloc/auth/bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Logger.level = Level.verbose;
  await init();
  runApp(BlocProvider<AuthBloc>(
    create: (_) => sl<AuthBloc>()..add(AuthEventAppStarted()),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  final _logger = Logger();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state){
          _logger.v('State: $state');

          if (state is AuthStateUninitialized) {
            _logger.v('Showing the splash page.');
            return SplashPage();
          }

          if (state is AuthStateUnauthorized) {
            _logger.v('Showing login page.');
            return BlocProvider<LoginBloc>(
              create: (context) {
                  return LoginBloc(
                    authBloc: BlocProvider.of<AuthBloc>(context),
                    authUsecase: sl<AuthUsecase>()
                  );
              },
              child: LoginPage(),
            );
          }

          if (state is AuthStateAuthorized) {
            _logger.v('Showing home page.');
            return Container(
              color: Colors.white,
              child: Center(
                child: Text("HOOOMEEE"),
              ),
            );
          }

          return Container(color: Colors.red,);
        },
      )
    );
  }
}

