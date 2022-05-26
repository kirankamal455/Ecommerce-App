import 'dart:async';

import 'package:calzada/app/data/models/cart_model.dart' as c;
import 'package:calzada/app/data/models/cart_product_model.dart';
import 'package:calzada/app/data/models/product_model.dart' as p;

import 'package:calzada/app/data/models/specificCategory_model.dart' as q;

import 'package:calzada/app/data/provider/shop/i_shop_provider.dart';

import 'package:multiple_result/multiple_result.dart';

import 'i_shop_repository.dart';

class ShopRepository extends IShopRepository {
  ShopRepository({required this.shopProvider});
  late IShopProvider shopProvider;
  List<CartProductModel> cartdata = [];
  @override
  Future<Result<Exception, List<p.Product>>> getAllProduct() async {
    var response = await shopProvider.getAllproducts();

    if (response.statusCode == 200) {
      var data = response.data as List;
      var product = data.map((e) => p.Product.fromMap(e)).toList();

      print('List data :$product');
      return Success(product);
    } else {
      return Error(Exception(response.data));
    }
  }

  @override
  Future<Result<Exception, p.Product>> getaSingleProduct(
      {required int id}) async {
    var response = await shopProvider.getASingleProduct(id: id);

    if (response.statusCode == 200) {
      var product = p.Product.fromMap(response.data);

      // cartdata.add( );

      return Success(product);
    } else {
      print('error');
      return Error(Exception(response.data));
    }
  }

  @override
  Future<Result<Exception, List<c.Cart>>> getAllCart() async {
    var response = await shopProvider.getAllCarts();
    if (response.statusCode == 200) {
      var data = response.data as List;
      var product = data.map((e) => c.Cart.fromMap(e)).toList();
      return Success(product);
    } else {
      print('error');
      return Error(Exception(response.data));
    }
  }

  @override
  Future<Result<Exception, List<String>>> getAllProductCategories() async {
    var response = await shopProvider.getAllCategories();

    if (response.statusCode == 200) {
      List<dynamic> value = response.data as List;
      List<String> result = value.cast<String>();

      return Success(result);
    } else {
      return Error(Exception(response.data));
    }
  }

  @override
  Future<Result<Exception, List<q.Category>>> getSpecificCategories(
      {required String category}) async {
    var response =
        await shopProvider.getProductsSpecificCategory(category: category);
    print(response);
    if (response.statusCode == 200) {
      var result = response.data as List;
      var product = result.map((e) => q.Category.fromMap(e)).toList();

      return Success(product);
    } else {
      return Error(Exception(response.data));
    }
  }

  @override
  Future<Result<Exception, List<p.Product>>> productSort() async {
    var response = await shopProvider.sortResult();

    if (response.statusCode == 200) {
      var data = response.data as List;
      var product = data.map((e) => p.Product.fromMap(e)).toList();

      return Success(product);
    } else {
      print('error');
      return Error(Exception(response.data));
    }
  }

  @override
  Future<Result<Exception, bool>> addProductToCart(
      {required String userId,
      required String date,
      required String productId,
      required String quantity}) async {
    var response = await shopProvider.addToCart(
        userId: userId, date: date, productId: productId, quantity: quantity);
    if (response.statusCode == 200) {
      print('Product Succesfully Added To Cart');
      return Success(true);
    } else {
      print('Product is not added to cart');
      return Error(Exception(response.data));
    }
  }

  @override
  Future<Result<Exception, bool>> deleteACart({required int id}) async {
    var response = await shopProvider.deleteACart(id: id);

    if (response.statusCode == 200) {
      print('Product Succesfully Deleted From Cart');
      return Success(true);
    } else {
      print("Can't Delete ");
      return Error(Exception(response.data));
    }
  }

  @override
  Future<Result<Exception, p.Product>> getSingleProduct(
      {required int id}) async {
    var response = await shopProvider.getASingleProduct(id: id);

    if (response.statusCode == 200) {
      var product = p.Product.fromMap(response.data);
      // var result = response.data as List;
      // var product=result.map((e) =>CartProductModel.fromMap(e)).toList();
      // print(' value $product');
      // cartdata.add( );

      return Success(product);
    } else {
      print('error');
      return Error(Exception(response.data));
    }
  }
}
