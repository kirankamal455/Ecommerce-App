import 'package:calzada/app/data/provider/shop/shop_provider.dart';
import 'package:calzada/app/data/repository/shop/i_shop_repository.dart';
import 'package:calzada/app/data/repository/shop/shop_repository.dart';
import 'package:get/get.dart';

import '../../../data/provider/shop/i_shop_provider.dart';
import '../controllers/cartpage_controller.dart';

class CartpageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CartpageController>(
      () => CartpageController(shopRepository: Get.find()),
    );
    Get.lazyPut<IShopRepository>(
        () => ShopRepository(shopProvider: Get.find()));
    Get.lazyPut<IShopProvider>(() => ShopProvider());
  }
}
