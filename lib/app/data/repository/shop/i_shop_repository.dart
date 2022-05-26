import 'package:calzada/app/data/models/cart_model.dart' as c;
import 'package:calzada/app/data/models/cart_product_model.dart';
import 'package:calzada/app/data/models/product_model.dart' as p;
import 'package:calzada/app/data/models/specificCategory_model.dart' as q;
import 'package:multiple_result/multiple_result.dart';

abstract class IShopRepository {
  Future<Result<Exception, List<p.Product>>> getAllProduct();
  Future<Result<Exception, p.Product>> getaSingleProduct({required int id});
  Future<Result<Exception, List<c.Cart>>> getAllCart();
  Future<Result<Exception, List<String>>> getAllProductCategories();
  Future<Result<Exception, List<q.Category>>> getSpecificCategories(
      {required String category});
  Future<Result<Exception, bool>> addProductToCart(
      {required String userId,
      required String date,
      required String productId,
      required String quantity});
  Future<Result<Exception, bool>> deleteACart({required int id});
  Future<Result<Exception, List<p.Product>>> productSort();
  Future<Result<Exception, p.Product>> getSingleProduct({required int id});
}
