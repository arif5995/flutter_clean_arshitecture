part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  LoginEvent([List props = const <dynamic>[]]) : super(props);
}

class LoginEventFormSubmit extends LoginEvent {
  final String username;
  final String password;

  LoginEventFormSubmit({@required this.username, @required this.password})
      : super([username, password]);

  @override
  List<Object> get props => [username, password];

  @override
  String toString() =>
      'LoginEventFormSubmit { username: $username, password: $password }';
}

