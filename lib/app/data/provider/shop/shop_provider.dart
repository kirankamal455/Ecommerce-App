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
    dio.options.connectTimeout = 30000;
    dio.options.receiveTimeout = 30000;
    dio.interceptors.addAll([
      dioLoggerInterceptor,
      RetryInterceptor(
          dio: dio,
          retries: 2,
          retryDelays: [
            const Duration(seconds: 1),
            const Duration(seconds: 2),
            const Duration(seconds: 3),
          ],
          retryEvaluator: (error, i) {
            if (error.type == DioErrorType.other &&
                error.error is SocketException) {
              return true;
            } else {
              return false;
            }
          }),
      ShopInterceptor(dio: dio),
    ]);
  }

  @override
  Future<Response> getAllproducts() async {
    return await dio.get("/products");
  }

  @override
  Future<Response> getASingleProduct({required int id}) async {
    return await dio.get("/products/$id");
  }

  @override
  Future<Response> getAllCategories() async {
    return await dio.get("/products/categories");
  }

  @override
  Future<Response> getProductsSpecificCategory(
      {required String category}) async {
    return await dio.get("/products/category/$category");
  }

  @override
  Future<Response> getAllCarts() async {
    return await dio.get("/carts/user/1");
  }

  @override
  Future<Response> getSingleCart({required String cartid}) async {
    return await dio.get("/carts/$cartid");
  }

  @override
  Future<Response> addToCart(
      {required String userId,
      required String date,
      required String productId,
      required String quantity}) async {
    var respose = await dio.post("/carts", data: {
      ' userId': userId,
      'date': date,
      ' products': [
        {'productId': productId, 'quantity': quantity},
      ]
    });
    return respose;
  }

  @override
  Future<Response> deleteACart({required int id}) async {
    return await dio.delete('/carts/$id');
  }

  @override
  Future<Response> sortResult() async {
    return await dio.get('/products?sort=desc');
  }
}
