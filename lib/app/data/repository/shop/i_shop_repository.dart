import 'package:calzada/app/data/models/shop_model.dart';
import 'package:multiple_result/multiple_result.dart';

abstract class IShopRepository {
  Future<Result<Exception, List<Shop>>> getAllProduct();
  Future<Result<Exception, List<Shop>>> firstData({required String id});
}
