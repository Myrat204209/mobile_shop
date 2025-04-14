part of 'connectivity_bloc.dart';

sealed class ConnectivityEvent extends Equatable {
  const ConnectivityEvent();

  @override
  List<Object> get props => [];
}

// Use 'final' for concrete event classes to prevent further subclassing
final class ConnectivityObserve extends ConnectivityEvent {
  // No fields needed, add constructor if necessary
  const ConnectivityObserve();
  // No need to override props if inheriting from base and no new fields
}

// Internal event triggered by the stream listener
// Still 'internal' by convention (_), but marked final
final class _ConnectivityChanged extends ConnectivityEvent {
  final List<ConnectivityResult> connectivityType;

  const _ConnectivityChanged(this.connectivityType);

  @override
  List<Object> get props => [connectivityType];
}
