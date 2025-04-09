part of 'connection_bloc.dart';

sealed class ConnectionEvent extends Equatable {
  const ConnectionEvent();

  @override
  List<Object> get props => [];
}

// Use 'final' for concrete event classes to prevent further subclassing
final class ConnectionObserve extends ConnectionEvent {
  // No fields needed, add constructor if necessary
  const ConnectionObserve();
  // No need to override props if inheriting from base and no new fields
}

// Internal event triggered by the stream listener
// Still 'internal' by convention (_), but marked final
final class _ConnectionChanged extends ConnectionEvent {
  final List<ConnectivityResult> connectionType;

  const _ConnectionChanged(this.connectionType);

  @override
  List<Object> get props => [connectionType];
}
