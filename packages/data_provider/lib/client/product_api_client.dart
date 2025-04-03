// product_api_service.dart
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

// Assume Product model exists with fromJson/toJson (often uses json_serializable)
import 'models/product.dart';

part 'product_api_client.g.dart'; // Generated file name

@RestApi() // BaseUrl can be omitted to use the one from the provided Dio instance
abstract class ProductApiClient {
  // Factory constructor needs a Dio instance.
  // It will generate the implementation class _ProductApiService
  factory ProductApiClient(Dio dio, {String baseUrl}) = _ProductApiClient;

  // Define endpoints matching your API
  @GET('/products')
  Future<List<Product>> getProducts();

  @GET('/products/{id}')
  Future<Product> getProductById(@Path('id') String productId);

  @POST('/products')
  Future<Product> createProduct(@Body() Product newProduct);

}