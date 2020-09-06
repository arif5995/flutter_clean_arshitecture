import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class AuthEvent extends Equatable{
  AuthEvent([List props = const <dynamic>[]]) : super(props);
}

class AuthEventAppStarted extends AuthEvent{}

/// This event is triggered when an authentication token is retrieved from
/// the server.
class AuthEventLoggedIn extends AuthEvent{
  final String username;
  final String environment;
  final Map<String, dynamic> userInfo;

  AuthEventLoggedIn({
    @required this.username,
    this.environment,
    @required this.userInfo}) :
    assert(userInfo != null),
    assert(username != null),
    super([userInfo,username]);

  @override
  List<Object> get props => [userInfo, username];

  @override
  String toString() => 'LoggedIn { token: $userInfo, clients: $username }';
}