import 'package:fluttercleanarshitecture/feature/Login/data/repositories/auth_repositoryImpl.dart';
import 'package:fluttercleanarshitecture/feature/Login/domain/repositories/auth_repository.dart';
import 'package:fluttercleanarshitecture/feature/Login/domain/usecase/auth_usecase.dart';
import 'package:fluttercleanarshitecture/feature/Login/presentation/bloc/auth/auth_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final GetIt sl =GetIt.instance;

Future<void> init() async{
  // Register the BLoC instances.
  sl.registerFactory(() => AuthBloc(usecase: sl()));

  // Register UseCase instances.
  sl.registerLazySingleton(() => AuthUsecase(sl()));

  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl());

  final sharedPreferences = await SharedPreferences.getInstance();

  sl.registerLazySingleton(() => sharedPreferences);
}