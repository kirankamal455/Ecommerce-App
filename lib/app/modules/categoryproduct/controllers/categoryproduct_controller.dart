import 'package:calzada/app/data/models/specificCategory_model.dart';
import 'package:calzada/app/data/repository/shop/i_shop_repository.dart';
import 'package:get/get.dart';

class CategoryproductController extends GetxController
    with StateMixin<List<Category>> {
  IShopRepository shopRepository;

  CategoryproductController({
    required this.shopRepository,
  });
  final count = 0.obs;
  @override
  Future<void> onInit() async {
    await getSpecificCatergories();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
  String category = Get.arguments;

  Future<void> getSpecificCatergories() async {
    print(Category);

    var result = await shopRepository.getSpecificCategories(category: category);
    print(result);
    change(null, status: RxStatus.loading());
    print(result);
    result.when((error) {
      change(null, status: RxStatus.error(error.toString()));
    }, (products) {
      change(products, status: RxStatus.success());
    });
  }
}
