import 'package:calzada/app/data/models/shop_model.dart';
import 'package:calzada/app/data/provider/shop/i_shop_provider.dart';
import 'package:dio/src/response.dart';
import 'package:multiple_result/multiple_result.dart';

import 'i_shop_repository.dart';

class ShopRepository extends IShopRepository {
  ShopRepository({required this.shopProvider});
  late IShopProvider shopProvider;

  @override
  Future<Result<Exception, List<Shop>>> getAllProduct() async {
    var response = await shopProvider.getData();
    print('response data $response');
    if (response.statusCode == 200) {
      var data = response.data as List;

      var product = data.map((e) => Shop.fromMap(e)).toList();
      print('List data :$product');
      return Success(product);
    } else {
      return Error(Exception(response.data));
    }
  }

  @override
  Future<Result<Exception, List<Shop>>> firstData({required String id}) async {
    var response = await shopProvider.productData(id: id);
    print('response data $response');
    if (response.statusCode == 200) {
      // List data = json.decode(response.data);
//  var product= responseJson.map((e) =  User.fromJson(e)).toList();
      // var data = response.toString() as List;

      // var product = data.map((e) => Shop.fromMap(e)).toList();
      var product = (Shop.fromJson(response.data) as List)
          .map((data) => Shop.fromJson(data))
          .toList();
      print('List data :$product');
      return Success(product);
    } else {
      print('error');
      return Error(Exception(response.data));
    }
  }
}
