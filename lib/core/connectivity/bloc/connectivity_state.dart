part of 'connectivity_bloc.dart';

sealed class ConnectivityState extends Equatable {
  const ConnectivityState();

  @override
  List<Object?> get props => [];
}

final class ConnectivityInitial extends ConnectivityState {}

final class ConnectivityOnline extends ConnectivityState {
  final List<ConnectivityResult> connectivityType;

  const ConnectivityOnline(this.connectivityType);

  @override
  List<Object?> get props => [connectivityType];
}

// State indicating no connectivity
final class ConnectivityOffline extends ConnectivityState {}
