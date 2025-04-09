part of 'connection_bloc.dart';

sealed class ConnectionState extends Equatable {
  const ConnectionState();

  @override
  List<Object?> get props => [];
}

final class ConnectionInitial extends ConnectionState {}

final class ConnectionOnline extends ConnectionState {
  final List<ConnectivityResult> connectionType;

  const ConnectionOnline(this.connectionType);

  @override
  List<Object?> get props => [connectionType];
}

// State indicating no connection
final class ConnectionOffline extends ConnectionState {}
