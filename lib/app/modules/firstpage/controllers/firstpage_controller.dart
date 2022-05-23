// ignore_for_file: unnecessary_overrides

import 'package:get/get.dart';

class FirstpageController extends GetxController {
  // ignore: todo
  //TODO: Implement FirstpageController

  final count = 0.obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
