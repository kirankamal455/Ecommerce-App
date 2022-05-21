import 'package:get/get.dart';

class SecondpageController extends GetxController {
  var count = 0.obs;
  increment() => count++;
  decrement() {
    if (count < 1) {
      return;
    } else {
      count--;
    }
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
