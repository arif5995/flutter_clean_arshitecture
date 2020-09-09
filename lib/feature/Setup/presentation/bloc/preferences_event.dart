part of 'preferences_bloc.dart';

abstract class PreferencesEvent extends Equatable {
  PreferencesEvent();
}

class GetHostEvent extends PreferencesEvent {
  GetHostEvent();

  @override
  List<Object> get props => [];
}

class SetHostEvent extends PreferencesEvent {
  final String host;

  SetHostEvent({@required this.host});

  @override
  List<Object> get props => [host];
}