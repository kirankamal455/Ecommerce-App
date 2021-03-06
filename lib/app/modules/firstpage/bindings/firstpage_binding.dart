import 'package:calzada/app/data/provider/shop/i_shop_provider.dart';
import 'package:calzada/app/data/provider/shop/shop_provider.dart';
import 'package:calzada/app/data/repository/shop/i_shop_repository.dart';
import 'package:calzada/app/data/repository/shop/shop_repository.dart';
import 'package:calzada/app/modules/cartpage/controllers/cartpage_controller.dart';
import 'package:get/instance_manager.dart';

import '../controllers/firstpage_controller.dart';

class FirstpageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FirstpageController>(
      () => FirstpageController(),
    );
    Get.lazyPut<CartpageController>(
        () => CartpageController(shopRepository: Get.find()));
    Get.lazyPut<IShopRepository>(
        () => ShopRepository(shopProvider: Get.find()));
    Get.lazyPut<IShopProvider>(() => ShopProvider());
  }
}
