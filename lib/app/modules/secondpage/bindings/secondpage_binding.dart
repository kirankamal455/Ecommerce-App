import 'package:calzada/app/modules/cartpage/controllers/cartpage_controller.dart';
import 'package:get/get.dart';

import '../controllers/secondpage_controller.dart';

class SecondpageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SecondpageController>(
      () => SecondpageController(shopRepository: Get.find()),
    );
    Get.lazyPut(() => CartpageController(shopRepository: Get.find()));
  }
}
