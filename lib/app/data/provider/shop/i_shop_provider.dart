import 'package:dio/dio.dart';

abstract class IShopProvider {
  Future<Response> getAllproducts();
  Future<Response> getASingleProduct({required int id});
  Future<Response> getAllCategories();
  Future<Response> getProductsSpecificCategory({required String category});
  Future<Response> getAllCarts();
  Future<Response> getSingleCart({required String cartid});
  Future<Response> addToCart(
      {required String userId,
      required String date,
      required String productId,
      required String quantity});
  Future<Response> deleteACart({required int id});
  Future<Response> sortResult();
}
