import 'package:dio/dio.dart';

abstract class IShopProvider {
  Future<Response> getData();
  Future<Response> productData({required String id});
}
