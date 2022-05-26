import 'package:calzada/app/data/repository/shop/i_shop_repository.dart';

import 'package:get/get.dart';

class CategoriesController extends GetxController
    with StateMixin<List<String>> {
  IShopRepository shopRepository;

  CategoriesController({required this.shopRepository});

  final count = 0.obs;
  @override
  Future<void> onInit() async {
    await getallCatergories();
    super.onInit();
  }

  Future<void> getallCatergories() async {
    var result = await shopRepository.getAllProductCategories();
    change(null, status: RxStatus.loading());
    print(result);
    result.when((error) {
      change(null, status: RxStatus.error(error.toString()));
    }, (products) {
      print(result);
      change(products, status: RxStatus.success());
    });
  }
}
