import 'dart:async';
import 'dart:developer' show log;

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
    // Keep current data while loading to avoid UI flicker if data hasn't changed
    final currentState = state;
    emit(state.copyWith(status: PreloaderStatus.loading));
    try {
      final newPreloadItem = await _preloaderRepository.getPreload();
      final latestModDateInNewItem = findLatestModDate(newPreloadItem);
      // Get the last update time from the current state (before loading)
      final currentLastUpdated = currentState.lastUpdated;
      // --- Comparison Logic ---
      bool shouldUpdate = false;
      if (newPreloadItem == null && currentState.preloadItem != null) {
        // Handle case where API returns empty but we had data
        shouldUpdate = true; // Update state to reflect empty data
      } else if (latestModDateInNewItem == null) {
        // If new item has no dates, only update if current state is also null
        shouldUpdate = currentState.preloadItem == null;
      } else if (currentLastUpdated == null ||
          latestModDateInNewItem.isAfter(currentLastUpdated)) {
        // Update if no previous date stored OR new data's latest date is newer
        shouldUpdate = true;
      }
      if (shouldUpdate) {
        log(
          "PreloaderBloc: New data is available or first load. Updating state.",
        );
        emit(
          state.copyWith(
            preloadItem:
                newPreloadItem, // This will calc new lastUpdated via copyWith
            status: PreloaderStatus.success,
            forceUpdatePreloadItem:
                true, // Ensure null item is updated if needed
          ),
        );
      } else {
        log(
          "PreloaderBloc: Fetched data is not newer than current state. Keeping existing data.",
        );
        // Fetched data isn't newer. Emit success, but keep the existing item/date.
        // We only need to ensure the status is 'success'.
        // If the status was already success, this might be redundant,
        // but it handles the case where the initial state was different.
        if (currentState.status != PreloaderStatus.success) {
          emit(currentState.copyWith(status: PreloaderStatus.success));
        } else {
          // If status was already success and data hasn't changed, no emit needed
          // Or emit the loading state's copyWith success (which uses current data)
          emit(state.copyWith(status: PreloaderStatus.success));
        }
      }
      // emit(
      //   state.copyWith(
      //     preloadItem: preloadItem,
      //     status: PreloaderStatus.success,
      //   ),
      // )
    } catch (error, stackTrace) {
      emit(state.copyWith(status: PreloaderStatus.failure));
      addError(error, stackTrace);
    }
  }

  @override
  PreloaderState? fromJson(Map<String, dynamic> json) {
    try {
      log("PreloaderBloc: Attempting to restore state from JSON");
      final statusString = json['status'] as String?;
      final preloadItemJson = json['preloadItem'] as Map<String, dynamic>?;
      final lastUpdatedString =
          json['lastUpdated'] as String?; // Get stored date string

      // Need at least status to be valid
      if (statusString == null) return null;

      PreloadItem? preloadItem =
          preloadItemJson != null
              ? PreloadItem.fromJson(preloadItemJson)
              : null;

      DateTime? lastUpdated =
          lastUpdatedString != null
              ? DateTime.tryParse(lastUpdatedString)
              : null;

      if (preloadItem != null &&
          findLatestModDate(preloadItem) != lastUpdated) {
        log(
          "PreloaderBloc Warning: Stored lastUpdated doesn't match calculated. Recalculating.",
        );
        lastUpdated = findLatestModDate(preloadItem);
      }

      return PreloaderState(
        status: PreloaderStatus.values.firstWhere(
          (e) => e.toString() == statusString,
          orElse: () => PreloaderStatus.initial,
        ),
        preloadItem: preloadItem,
        lastUpdated: lastUpdated,
      );
    } catch (e) {
      log("PreloaderBloc: Error during fromJson: $e");
      return null;
    }
  }

  @override
  Map<String, dynamic>? toJson(PreloaderState state) {
    // Only persist if status is success and data is present? Or always persist?
    // Persisting always allows recovering last known state even after failure.
    // Let's persist always, but maybe filter null items if desired.
    if (state.status == PreloaderStatus.initial && state.preloadItem == null) {
      // Avoid saving initial empty state if not desired
      // return null;
    }

    log("PreloaderBloc: Saving state to JSON (Status: ${state.status})");
    return {
      'status': state.status.toString(),
      'preloadItem': state.preloadItem?.toJson(),
      'lastUpdated': state.lastUpdated?.toIso8601String(),
    };
  }
}
