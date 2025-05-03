import 'package:data_provider/data_provider.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'preloader_client.g.dart';

@RestApi()
abstract class PreloaderClient {
  factory PreloaderClient(Dio dio, {String baseUrl}) = _PreloaderClient;

  @GET('/preloader')
  Future<PreloadItem> getPreloader();
}
