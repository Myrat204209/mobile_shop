// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'preloader_bloc.dart';

enum PreloaderStatus { initial, loading, success, failure }

class PreloaderState extends Equatable {
  const PreloaderState({required this.status, this.preloadItem});

  const PreloaderState.initial() : this(status: PreloaderStatus.initial);
  final PreloaderStatus status;
  final PreloadItem? preloadItem;

  @override
  List<Object?> get props => [status, preloadItem];

  PreloaderState copyWith({PreloaderStatus? status, PreloadItem? preloadItem}) {
    return PreloaderState(
      status: status ?? this.status,
      preloadItem: preloadItem ?? this.preloadItem,
    );
  }
}
