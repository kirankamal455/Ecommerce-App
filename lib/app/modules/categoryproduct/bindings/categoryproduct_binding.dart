import 'package:calzada/app/data/provider/shop/i_shop_provider.dart';
import 'package:calzada/app/data/provider/shop/shop_provider.dart';
import 'package:calzada/app/data/repository/shop/i_shop_repository.dart';
import 'package:calzada/app/data/repository/shop/shop_repository.dart';
import 'package:get/get.dart';

import '../controllers/categoryproduct_controller.dart';

class CategoryproductBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CategoryproductController>(
      () => CategoryproductController(shopRepository: Get.find()),
    );
    Get.lazyPut<IShopRepository>(
        () => ShopRepository(shopProvider: Get.find()));
    Get.lazyPut<IShopProvider>(() => ShopProvider());
  }
}
