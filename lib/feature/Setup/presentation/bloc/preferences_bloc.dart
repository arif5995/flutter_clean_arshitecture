import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fluttercleanarshitecture/feature/Setup/domain/usecase/get_host.dart';
import 'package:fluttercleanarshitecture/feature/Setup/domain/usecase/set_host.dart';
import 'package:meta/meta.dart';

part 'preferences_event.dart';
part 'preferences_state.dart';

class PreferencesBloc extends Bloc<PreferencesEvent, PreferencesState> {
  final GetHost getHost;
  final SetHost setHost; 

  PreferencesBloc({
    @required this.setHost, 
    @required this.getHost});

  @override
  Stream<PreferencesState> mapEventToState(
    PreferencesEvent event,
  ) async* {
    if(event is GetHostEvent ){
    yield HostLoadingState();
    final failureOrModel = await getHost();
    yield failureOrModel.fold((failure) => PreferencesErrorState(message: failure.message),
            (host) => HostLoadedState(host: host));
    }else if (event is SetHostEvent) {
      yield HostLoadedState();
      final failureOrModel = await setHost(event.host);
      yield failureOrModel.fold((failure) => PreferencesErrorState(message: failure.message),
            (host) => SetHostSuccessState(host: host),);
    }
  }

  @override
  PreferencesState get initialState => InitialPreferencesState();
}
