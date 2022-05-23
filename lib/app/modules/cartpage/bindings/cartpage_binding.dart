import 'package:get/get.dart';

import '../controllers/cartpage_controller.dart';

class CartpageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CartpageController>(
      () => CartpageController(),
    );
  }
}
