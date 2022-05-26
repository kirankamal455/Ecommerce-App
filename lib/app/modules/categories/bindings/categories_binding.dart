import 'package:calzada/app/data/provider/shop/i_shop_provider.dart';
import 'package:calzada/app/data/provider/shop/shop_provider.dart';
import 'package:calzada/app/data/repository/shop/i_shop_repository.dart';
import 'package:calzada/app/data/repository/shop/shop_repository.dart';
import 'package:calzada/app/modules/home/controllers/home_controller.dart';
import 'package:get/get.dart';

import '../controllers/categories_controller.dart';

class CategoriesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CategoriesController>(
      () => CategoriesController(shopRepository: Get.find()),
    );
    Get.lazyPut<IShopRepository>(
        () => ShopRepository(shopProvider: Get.find()));
    Get.lazyPut<IShopProvider>(() => ShopProvider());
    Get.lazyPut<HomeController>(
        () => HomeController(shopRepository: Get.find()));
  }
}
