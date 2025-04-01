import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';
import 'package:talker_flutter/talker_flutter.dart';

class Http extends DioForNative {
  final String _defaultBaseUrl;
  final Talker? _talker;

  Http({required String defaultBaseUrl, Talker? talker})
    : _defaultBaseUrl = defaultBaseUrl,
      _talker = talker,
      super(
        BaseOptions(
          baseUrl: defaultBaseUrl,
          connectTimeout: const Duration(milliseconds: 20000),
          receiveTimeout: const Duration(milliseconds: 20000),
        ),
      ) {
    interceptors.addAll([TalkerDioLogger(talker: _talker)]);
  }
   /// If given value is null default is used
  void updateBaseUrl(String? baseUrl) {
    options.baseUrl = baseUrl ?? _defaultBaseUrl;
  }
}
