import 'package:calzada/app/data/provider/shop/interceptor/shop_api_error_handler.dart';
import 'package:dio/dio.dart';

class ShopInterceptor extends Interceptor {
  late Dio dio;
  ShopInterceptor({required this.dio});
  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    super.onRequest(options, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    handleUserAPIError(err, handler, dio);
  }
}
