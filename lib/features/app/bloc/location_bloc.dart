import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:mobile_shop/core/location/location.dart';
import 'package:talker_flutter/talker_flutter.dart';

// Events
abstract class LocationEvent {}

class InitializeLocation extends LocationEvent {}

// States
class LocationState {
  final String? address;
  final bool isLoading;
  final String? error;

  LocationState({this.address, this.isLoading = false, this.error});

  LocationState copyWith({String? address, bool? isLoading, String? error}) {
    return LocationState(
      address: address ?? this.address,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  final LocationService _locationService;
  final Talker _talker;

  LocationBloc({
    required LocationService locationService,
    required Talker talker,
  }) : _locationService = locationService,
       _talker = talker,
       super(LocationState()) {
    on<InitializeLocation>(_onInitializeLocation);
  }

  Future<void> _onInitializeLocation(
    InitializeLocation event,
    Emitter<LocationState> emit,
  ) async {
    try {
      emit(state.copyWith(isLoading: true));

      final position = await _locationService.getCurrentPosition();
      if (position != null) {
        final placemarks = await placemarkFromCoordinates(
          position.latitude,
          position.longitude,
        );

        if (placemarks.isNotEmpty) {
          final place = placemarks.first;
          final address = '${place.locality}, ${place.country}';
          emit(state.copyWith(address: address, isLoading: false));
        }
      }
    } catch (e, st) {
      _talker.handle(e, st);
      emit(state.copyWith(error: 'Failed to get location', isLoading: false));
    }
  }
}
