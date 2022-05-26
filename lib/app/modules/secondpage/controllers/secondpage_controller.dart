import 'package:calzada/app/data/models/product_model.dart';
import 'package:calzada/app/data/repository/shop/i_shop_repository.dart';
import 'package:get/get.dart';

class SecondpageController extends GetxController with StateMixin<Product> {
  late IShopRepository shopRepository;

  SecondpageController({
    required this.shopRepository,
  });

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
  void onInit() async {
    await getEachProduct();
    super.onInit();
  }

  @override
  void onClose() {}

  Future<void> getEachProduct() async {
    int id1 = Get.arguments;

    var result = await shopRepository.getaSingleProduct(id: id1);

    print(result);
    result.when((error) {
      print('Error');
      change(null, status: RxStatus.error(error.toString()));
    }, (product) {
      change(product, status: RxStatus.success());
      print(product);
    });
  }
}
