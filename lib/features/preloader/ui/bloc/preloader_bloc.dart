import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'preloader_event.dart';
part 'preloader_state.dart';

class PreloaderBloc extends Bloc<PreloaderEvent, PreloaderState> {
  PreloaderBloc() : super(PreloaderInitial()) {
    on<PreloaderEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
