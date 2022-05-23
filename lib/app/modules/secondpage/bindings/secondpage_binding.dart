import 'package:get/get.dart';

import '../controllers/secondpage_controller.dart';

class SecondpageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SecondpageController>(
      () => SecondpageController(shopRepository: Get.find()),
    );
  }
}
