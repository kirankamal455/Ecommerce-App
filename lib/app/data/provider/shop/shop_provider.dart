import 'package:calzada/app/data/provider/shop/interceptor/shop_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:dio_logger/dio_logger.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';

import 'i_shop_provider.dart';

import 'dart:io';

class ShopProvider implements IShopProvider {
  late Dio dio;
  @override
  ShopProvider() {
    dio = Dio();
    dio.options.baseUrl = "https://fakestoreapi.com";
    dio.options.connectTimeout = 5000;
    dio.options.receiveTimeout = 3000;
    dio.interceptors.addAll([
      dioLoggerInterceptor,
      RetryInterceptor(
          dio: dio,
          // specify log function (optional)
          // retry count (optional)
          retries: 2,
          retryDelays: [
            const Duration(seconds: 1),
            const Duration(seconds: 2),
            const Duration(seconds: 3),
          ],
          retryEvaluator: (error, i) {
            // only retry on DioError
            if (error.type == DioErrorType.other &&
                error.error is SocketException) {
              // only retry on timeout error
              return true;
            } else {
              return false;
            }
          }),
      ShopInterceptor(dio: dio),
    ]);
  }

  @override
  Future<Response> getData() async {
    return await dio.get("/products");
  }

  @override
  Future<Response> productData({required String id}) async {
    return await dio.get("/products/$id");
  }
}
