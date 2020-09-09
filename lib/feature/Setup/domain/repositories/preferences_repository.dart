
import 'package:dartz/dartz.dart';
import 'package:fluttercleanarshitecture/core/error/failure.dart';

abstract class PreferencesRepository{
  Future<Either<Failure, String>> getHost();
  Future<Either<Failure, String>> setHost(String host);
}