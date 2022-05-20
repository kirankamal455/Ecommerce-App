import 'package:get/get.dart';

import '../controllers/firstpage_controller.dart';

class FirstpageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FirstpageController>(
      () => FirstpageController(),
    );
  }
}
