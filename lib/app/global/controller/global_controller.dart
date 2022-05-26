import 'package:calzada/app/data/models/cart_model.dart';
import 'package:calzada/app/modules/cartpage/controllers/cartpage_controller.dart';
import 'package:get/get.dart';

class GlobalController extends GetxController {
  final CartpageController cartpageController = Get.find();

  List<Cart> items = List<Cart>.empty().obs;

  @override
  void onInit() async {
    await cartpageController.getAllCartDetails();
    print('myyyyyy:$items');
    super.onInit();
  }
}
