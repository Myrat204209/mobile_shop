import 'package:data_provider/data_provider.dart';
import 'package:equatable/equatable.dart';

abstract class PreloaderFailure with EquatableMixin implements Exception {
  const PreloaderFailure(this.error);
  final Object error;

  @override
  List<Object?> get props => [error];
}

class GetPreloaderException extends PreloaderFailure {
  const GetPreloaderException(super.error);
}

class PreloaderRepository {
  const PreloaderRepository({required PreloaderClient preloaderClient})
    : _preloaderClient = preloaderClient;
  final PreloaderClient _preloaderClient;

  Future<PreloadItem> getPreload() async {
    try {
      return await _preloaderClient.getPreloader();
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(GetPreloaderException(error), stackTrace);
    }
  }
}
