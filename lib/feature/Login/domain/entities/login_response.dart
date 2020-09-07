import 'package:equatable/equatable.dart';

class LoginResponse extends Equatable {
  // final List<SimpleListItem> clients;
  // final String token;
  final String username;
  final Map<String, dynamic> userInfo;
  final String environment;

  // LoginResponse({this.clients = const <SimpleListItem>[], @required this.token})
  //     : super([clients, token]);

  LoginResponse({this.username, this.userInfo, this.environment})
      : super([username, userInfo, environment]);
}