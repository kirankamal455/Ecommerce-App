import 'package:calzada/app/data/models/product_model.dart';
import 'package:get/get.dart';

import 'package:calzada/app/data/repository/shop/i_shop_repository.dart';

class HomeController extends GetxController with StateMixin<List<Product>> {
  IShopRepository shopRepository;

  HomeController({
    required this.shopRepository,
  });
  static List<Product> mylist = [];

  // String category = Get.arguments;
  @override
  void onInit() async {
    await getProduct();
    print('kiiiiiiii$mylist');

    super.onInit();
  }

  Future<void> getProduct() async {
    var result = await shopRepository.getAllProduct();
    change(null, status: RxStatus.loading());
    print(result);
    // mylist.addAll(result as List<Product>);
    result.when((error) {
      change(null, status: RxStatus.error(error.toString()));
    }, (products) {
      change(products, status: RxStatus.success());
    });
  }

  Future<void> sortProduct() async {
    var result = await shopRepository.productSort();
    change(null, status: RxStatus.loading());
    print(result);
    result.when((error) {
      change(null, status: RxStatus.error(error.toString()));
    }, (products) {
      change(products, status: RxStatus.success());
    });
  }
}
