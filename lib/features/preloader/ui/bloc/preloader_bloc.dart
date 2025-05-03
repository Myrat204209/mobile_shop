import 'dart:async';

import 'package:data_provider/data_provider.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:mobile_shop/features/preloader/data/repository/preloader_repository.dart';

part 'preloader_event.dart';
part 'preloader_state.dart';

class PreloaderBloc extends HydratedBloc<PreloaderEvent, PreloaderState> {
  PreloaderBloc({required PreloaderRepository preloaderRepository})
    : _preloaderRepository = preloaderRepository,
      super(PreloaderState.initial()) {
    on<PreloaderLoaded>(_onLoad);
  }
  final PreloaderRepository _preloaderRepository;

  FutureOr<void> _onLoad(
    PreloaderLoaded event,
    Emitter<PreloaderState> emit,
  ) async {
    try {
      emit(state.copyWith(status: PreloaderStatus.loading));
      final preloadItem = await _preloaderRepository.getPreload();
      emit(
        state.copyWith(
          preloadItem: preloadItem,
          status: PreloaderStatus.success,
        ),
      );
    } catch (error, stackTrace) {
      emit(state.copyWith(status: PreloaderStatus.failure));
      addError(error, stackTrace);
    }
  }

  @override
  PreloaderState? fromJson(Map<String, dynamic> json) {
    
    final status = json['status'] as String?;
    final preloadItem = json['preloadItem'] as Map<String, dynamic>?;
    if (status == null || preloadItem == null) {
      return null;
    }
    return PreloaderState(
      status: PreloaderStatus.values.firstWhere(
        (element) => element.toString() == status,
      ),
      preloadItem: PreloadItem.fromJson(preloadItem),
    );
  }

  @override
  Map<String, dynamic>? toJson(PreloaderState state) {
    return {
      'status': state.status.toString(),
      'preloadItem': state.preloadItem?.toJson(),
    };
  }
}
