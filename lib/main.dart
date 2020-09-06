import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttercleanarshitecture/feature/Login/presentation/bloc/auth/auth_bloc.dart';
import 'package:fluttercleanarshitecture/feature/Login/presentation/bloc/auth/auth_event.dart';
import 'package:fluttercleanarshitecture/feature/Login/presentation/bloc/auth/auth_state.dart';
import 'package:fluttercleanarshitecture/feature/Login/presentation/page/login_page.dart';
import 'package:fluttercleanarshitecture/feature/Splash/presentation/page/splash_page.dart';
import 'package:fluttercleanarshitecture/sevices_locator.dart';
import 'package:logger/logger.dart';
import 'package:fluttercleanarshitecture/sevices_locator.dart' as servicelocator;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Logger.level = Level.verbose;
  await servicelocator.init();
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
            return LoginPage();
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

