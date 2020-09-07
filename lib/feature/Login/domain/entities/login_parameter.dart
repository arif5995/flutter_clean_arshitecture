import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class LoginParameter extends Equatable {
  final String username;
  final String password;

  LoginParameter({@required this.username, @required this.password})
      : super([username, password]);
}