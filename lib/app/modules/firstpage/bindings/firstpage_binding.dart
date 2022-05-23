import 'package:get/instance_manager.dart';

import '../controllers/firstpage_controller.dart';

class FirstpageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FirstpageController>(
      () => FirstpageController(),
    );
  }
}
