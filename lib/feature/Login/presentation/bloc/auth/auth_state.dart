import 'package:equatable/equatable.dart';

abstract class AuthState extends Equatable{
  AuthState([List props = const <dynamic>[]]) : super(props);
}

/// The app's default state
class AuthStateUninitialized extends AuthState {}

class AuthStateUnauthorized extends AuthState {}

class AuthStateAuthorized extends AuthState{}