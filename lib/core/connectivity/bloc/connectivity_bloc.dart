// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'connectivity_event.dart';
part 'connectivity_state.dart';

class ConnectivityBloc extends Bloc<ConnectivityEvent, ConnectivityState> {
  final Connectivity _connectivity;
  StreamSubscription<List<ConnectivityResult>>? _connectivitySubscription;
  ConnectivityBloc({Connectivity? connectivity})
    : _connectivity = connectivity ?? Connectivity(),
      super(ConnectivityInitial()) {
    on<ConnectivityObserve>(_onObserve);
    on<_ConnectivityChanged>(_onChanged);
    add(ConnectivityObserve());
  }

  FutureOr<void> _onObserve(
    ConnectivityObserve event,
    Emitter<ConnectivityState> emit,
  ) async {
    try {
      final initialResult = await _connectivity.checkConnectivity();
      _emitConnectivityState(initialResult, emit);
    } catch (e) {
      emit(ConnectivityOffline());
    }
    // Cancel any existing subscription before starting a new one
    await _connectivitySubscription?.cancel();
    // Listen to the stream for future changes
    _connectivitySubscription = _connectivity.onConnectivityChanged.listen((
      List<ConnectivityResult> result,
    ) {
      // Add an internal event whenever the stream emits
      add(_ConnectivityChanged(result));
    });
  }

  void _onChanged(_ConnectivityChanged event, Emitter<ConnectivityState> emit) {
    _emitConnectivityState(event.connectivityType, emit);
  }

  void _emitConnectivityState(
    List<ConnectivityResult> results,
    Emitter<ConnectivityState> emit,
  ) {
    if (results.contains(ConnectivityResult.mobile) ||
        results.contains(ConnectivityResult.wifi) ||
        results.contains(ConnectivityResult.ethernet) ||
        results.contains(ConnectivityResult.vpn)) {
      emit(ConnectivityOnline(results));
    } else if (results.contains(ConnectivityResult.none)) {
      emit(ConnectivityOffline());
    } else {
      emit(ConnectivityOffline());
    }
  }

  @override
  Future<void> close() {
    _connectivitySubscription?.cancel();
    return super.close();
  }
}
