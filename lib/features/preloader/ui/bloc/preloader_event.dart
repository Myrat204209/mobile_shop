part of 'preloader_bloc.dart';

sealed class PreloaderEvent extends Equatable {
  const PreloaderEvent();

  @override
  List<Object> get props => [];
}

final class PreloaderLoaded extends PreloaderEvent {
  const PreloaderLoaded();
}
