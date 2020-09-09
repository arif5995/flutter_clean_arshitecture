part of 'preferences_bloc.dart';

abstract class PreferencesState extends Equatable {
  PreferencesState();
}

class InitialPreferencesState extends PreferencesState {
  @override
  List<Object> get props => [];
}

class HostLoadingState extends PreferencesState {
  @override
  List<Object> get props => [];
}

class PreferencesErrorState extends PreferencesState {
  final String message;

  PreferencesErrorState({@required this.message});

  @override
  List<Object> get props => [message];
}

class HostLoadedState extends PreferencesState {
  final String host;

  HostLoadedState({@required this.host});
  @override
  List<Object> get props => [host];
}

class SetHostSuccessState extends PreferencesState {
  final String host;

  SetHostSuccessState({@required this.host});
  @override
  List<Object> get props => [host];
}
