import 'package:dartz/dartz.dart';
import 'package:fluttercleanarshitecture/core/error/failure.dart';
import 'package:fluttercleanarshitecture/feature/Setup/domain/repositories/preferences_repository.dart';

class GetHost{
  final PreferencesRepository repository;

  GetHost(this.repository);

  Future<Either<Failure, String>> call() async {
    return await repository.getHost();
  }
}