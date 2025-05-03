part of 'preloader_bloc.dart';

sealed class PreloaderState extends Equatable {
  const PreloaderState();
  
  @override
  List<Object> get props => [];
}

final class PreloaderInitial extends PreloaderState {}
