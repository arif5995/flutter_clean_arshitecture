import 'package:dartz/dartz.dart';
import 'package:fluttercleanarshitecture/core/error/failure.dart';
import 'package:fluttercleanarshitecture/feature/Setup/domain/repositories/preferences_repository.dart';

class SetHost {
  final PreferencesRepository repository;

  SetHost(this.repository);

  Future<Either<Failure, String>> call(String host) async {
    return await repository.setHost(host);
  }
}