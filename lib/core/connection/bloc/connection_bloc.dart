// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'connection_event.dart';
part 'connection_state.dart';

class ConnectionBloc extends Bloc<ConnectionEvent, ConnectionState> {
  final Connectivity _connectivity;
  StreamSubscription<List<ConnectivityResult>>? _connectivitySubscription;
  ConnectionBloc({Connectivity? connectivity})
    : _connectivity = connectivity ?? Connectivity(),
      super(ConnectionInitial()) {
    on<ConnectionObserve>(_onObserve);
    on<_ConnectionChanged>(_onChanged);
    add(ConnectionObserve());
  }

  FutureOr<void> _onObserve(
    ConnectionObserve event,
    Emitter<ConnectionState> emit,
  ) async {
    try {
      final initialResult = await _connectivity.checkConnectivity();
      _emitConnectivityState(initialResult, emit);
    } catch (e) {
      emit(ConnectionOffline());
    }
    // Cancel any existing subscription before starting a new one
    await _connectivitySubscription?.cancel();
    // Listen to the stream for future changes
    _connectivitySubscription = _connectivity.onConnectivityChanged.listen((
      List<ConnectivityResult> result,
    ) {
      // Add an internal event whenever the stream emits
      add(_ConnectionChanged(result));
    });
  }

  void _onChanged(_ConnectionChanged event, Emitter<ConnectionState> emit) {
    _emitConnectivityState(event.connectionType, emit);
  }

  void _emitConnectivityState(
    List<ConnectivityResult> results,
    Emitter<ConnectionState> emit,
  ) {
    if (results.contains(ConnectivityResult.mobile) ||
        results.contains(ConnectivityResult.wifi) ||
        results.contains(ConnectivityResult.ethernet) ||
        results.contains(ConnectivityResult.vpn)) {
      emit(ConnectionOnline(results));
    } else if (results.contains(ConnectivityResult.none)) {
      emit(ConnectionOffline());
    } else {
      emit(ConnectionOffline());
    }
  }

  @override
  Future<void> close() {
    _connectivitySubscription?.cancel();
    return super.close();
  }
}
