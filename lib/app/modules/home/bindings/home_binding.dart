import 'package:calzada/app/data/provider/shop/i_shop_provider.dart';
import 'package:calzada/app/data/provider/shop/shop_provider.dart';
import 'package:calzada/app/data/repository/shop/i_shop_repository.dart';
import 'package:calzada/app/data/repository/shop/shop_repository.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(shopRepository: Get.find()),
    );
    Get.lazyPut<IShopRepository>(
        () => ShopRepository(shopProvider: Get.find()));
    Get.lazyPut<IShopProvider>(() => ShopProvider());
  }
}
