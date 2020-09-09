import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttercleanarshitecture/core/error/exception.dart';
import 'package:fluttercleanarshitecture/feature/Login/data/datasource/auth_datasource.dart';
import 'package:fluttercleanarshitecture/feature/Login/data/datasource/auth_datasourceImp.dart';
import 'package:fluttercleanarshitecture/feature/Login/data/repositories/auth_repositoryImpl.dart';
import 'package:fluttercleanarshitecture/feature/Login/domain/repositories/auth_repository.dart';
import 'package:fluttercleanarshitecture/feature/Login/domain/usecase/auth_usecase.dart';
import 'package:fluttercleanarshitecture/feature/Login/presentation/bloc/auth/auth_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

final GetIt sl = GetIt.instance;


Future<void> init() async {
  sl.registerFactory(() => AuthBloc(usecase: sl()));

  sl.registerLazySingleton(() => FlutterSecureStorage());

  sl.registerLazySingleton(() => AuthUsecase(sl()));

  sl.registerLazySingleton<AuthDataSource>(() => AuthDataSourceImp(
      dio: sl(),
      secureStorage: sl()));

  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(
      dataSource: sl(),));

  final sharedPreferences = await SharedPreferences.getInstance();

  sl.registerLazySingleton(() => sharedPreferences);
  
  sl.registerLazySingleton((){
    final BaseOptions options =
    BaseOptions(baseUrl: 'http://36.37.92.3:9281/jderest/v2/tokenrequest');
    Dio dio = Dio(options);

    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (RequestOptions options) async {
        final method = options.method;
        final uri = options.uri;
        final path = uri.path;
        print("$path");
        print("${options.data}");

        options.headers[HttpHeaders.acceptHeader] = Headers.jsonContentType;
        if (path.contains('/jderest/v2/tokenrequest')){
          options.headers[HttpHeaders.contentTypeHeader] =
              Headers.jsonContentType;

          if (method == 'PUT') {
            final token = await sl<FlutterSecureStorage>()
                .read(key: 'jwt0');

            options.headers[HttpHeaders.authorizationHeader] = 'Bearer $token';
          }
        } else if (method == 'GET' || method == 'POST' || method == 'PUT') {
          final key = path.contains('/auth')
              ? 'jwt0'
              : 'jwt1';

          final token = await sl<FlutterSecureStorage>().read(key: key);

          options.headers[HttpHeaders.authorizationHeader] = 'Bearer $token';
        }

        return options;
      }, onError: (DioError de) async {
      if (de.response?.statusCode == 400) {
        throw BadRequestException(de.message);
      } else if (de.response?.statusCode == 500) {
//        final response = de.response;
//        final serverError = ServerErrorModel.fromJson(response.data ?? {});
//        throw ServerException(serverError.detail ?? de.message);
      } else if (de.response?.statusCode == 401) {
        print('401');
        Dio tokenDio = new Dio();
        tokenDio.options = dio.options;

      } else {
        throw ClientException(de.message);
      }
    }
    ));
    return dio;
  });

//  sl.registerLazySingleton(() {
//    final String scheme = sharedPreferences.getString('pref.url.scheme') ?? 'http';
//    Dio dio = Dio();
//    dio.interceptors.add(InterceptorsWrapper(
//      onRequest: (RequestOptions options) async {
//        final method = options.method;
//        final uri = options.uri;
//        final path = uri.path;
//        print("$path");
//        print("${options.data}");
//
//        options.headers[HttpHeaders.acceptHeader] = Headers.jsonContentType;
//        if (path.contains('http://36.37.92.3:9281/jderest/v2/tokenrequest')){
//          options.headers[HttpHeaders.contentTypeHeader] =
//              Headers.jsonContentType;
//
//          if (method == 'PUT') {
//            final token = await sl<FlutterSecureStorage>()
//                .read(key: 'jwt0');
//
//            options.headers[HttpHeaders.authorizationHeader] = 'Bearer $token';
//          }
//        } else if (method == 'GET' || method == 'POST' || method == 'PUT') {
//          final key = path.contains('/auth')
//              ? 'jwt0'
//              : 'jwt1';
//
//          final token = await sl<FlutterSecureStorage>().read(key: key);
//
//          options.headers[HttpHeaders.authorizationHeader] = 'Bearer $token';
//        }
//
//        return options;
//      }, onError: (DioError de) async {
//      if (de.response?.statusCode == 400) {
//        throw BadRequestException(de.message);
//      } else if (de.response?.statusCode == 500) {
////        final response = de.response;
////        final serverError = ServerErrorModel.fromJson(response.data ?? {});
////        throw ServerException(serverError.detail ?? de.message);
//      } else if (de.response?.statusCode == 401) {
//        print('401');
//        Dio tokenDio = new Dio();
//        tokenDio.options = dio.options;
//
////        options.headers[HttpHeaders.acceptHeader] = Headers.jsonContentType;
////        final newreload = sl<AuthDataSource>();
////        await newreload.reload();
////        await newreload.reloadauth();
////        return dio.request(de.request.path,
////            data: de.request.data, options: de.request);
//      } else {
//        throw ClientException(de.message);
//      }
//    }
//    ));
//  });
}