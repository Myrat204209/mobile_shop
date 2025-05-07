// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'preloader_bloc.dart';

enum PreloaderStatus { initial, loading, success, failure }

class PreloaderState extends Equatable {
  const PreloaderState({
    required this.status,
    this.preloadItem,
    this.lastUpdated,
  });

  const PreloaderState.initial() : this(status: PreloaderStatus.initial);
  final PreloaderStatus status;
  final PreloadItem? preloadItem;
  final DateTime? lastUpdated;

  @override
  List<Object?> get props => [status, preloadItem, lastUpdated];

  PreloaderState copyWith({
    PreloaderStatus? status,
    PreloadItem? preloadItem,
    DateTime? lastUpdated,
    bool forceUpdatePreloadItem = false,
  }) {
    DateTime? effectiveLastUpdated;
    if (preloadItem != null) {
      effectiveLastUpdated = findLatestModDate(preloadItem);
    } else if (forceUpdatePreloadItem && preloadItem == null) {
      effectiveLastUpdated = null; // Explicitly nullify if forced
    } else {
      effectiveLastUpdated = this.lastUpdated; // Keep old if not updating item
    }
    return PreloaderState(
      status: status ?? this.status,
      preloadItem:
          (forceUpdatePreloadItem || preloadItem != null)
              ? preloadItem
              : this.preloadItem,
      lastUpdated: effectiveLastUpdated,
    );
  }
}

DateTime? findLatestModDate(PreloadItem? item) {
  if (item == null) return null;

  DateTime? latestDate = item.modDate;

  for (final page in item.pages) {
    if (latestDate == null || page.modDate.isAfter(latestDate)) {
      latestDate = page.modDate;
    }
    for (final widget in page.widgets) {
      if (latestDate == null || widget.modDate.isAfter(latestDate)) {
        latestDate = widget.modDate;
      }
    }
  }
  return latestDate;
}
