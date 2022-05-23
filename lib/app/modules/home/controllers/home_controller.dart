// ignore_for_file: unnecessary_overrides

import 'package:calzada/app/data/models/shop_model.dart';
import 'package:get/get.dart';

import 'package:calzada/app/data/repository/shop/i_shop_repository.dart';
import 'package:multiple_result/multiple_result.dart';

class HomeController extends GetxController with StateMixin<List<Shop>> {
  IShopRepository shopRepository;

  HomeController({
    required this.shopRepository,
  });

  final count = 0.obs;
  @override
  void onInit() async {
    await getProduct();
    super.onInit();
  }

  Future<Result<Exception, List<Shop>>> getProduct() async {
    var result = await shopRepository.getAllProduct();

    print(result);
    result.when((error) {
      change(null, status: RxStatus.error(error.toString()));
    }, (shop) {
      change(null, status: RxStatus.loading());
      change(shop, status: RxStatus.success());
    });
    return result;

    // if (result.isSuccess()) {
    //    change(result.isSuccess(), status: RxStatus.success());
    //   print("succes");
    // } else if (result.isError()) {
    //   print("error");
    //   change(null, status: RxStatus.error(result.getError().toString()));
    // }
  }
}
