part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  LoginState([List props = const <dynamic>[]]) : super(props);
}

class LoginStateInitial extends LoginState {}

class LoginStateLoading extends LoginState {}

class LoginStateSuccessJDE extends LoginState {}

class LoginStateFailed extends LoginState {
  final String message;

  LoginStateFailed({@required this.message}) : super([message]);
}
