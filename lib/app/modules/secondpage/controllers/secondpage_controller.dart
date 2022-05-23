import 'package:calzada/app/data/models/shop_model.dart';
import 'package:calzada/app/data/repository/shop/i_shop_repository.dart';
import 'package:calzada/app/modules/secondpage/views/secondpage_view.dart';
import 'package:get/get.dart';
import 'package:multiple_result/multiple_result.dart';

class SecondpageController extends GetxController with StateMixin<List<Shop>> {
  late IShopRepository shopRepository;

  SecondpageController({
    required this.shopRepository,
  });
  var count = 0.obs;

  String id1 = SecondpageView.id1;
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
  Future<Result<Exception, List<Shop>>> getEachProduct() async {
    var result = await shopRepository.firstData(id: id1);

    print(result);
    result.when((error) {
      print('Error');
      change(null, status: RxStatus.error(error.toString()));
    }, (first) {
      change(null, status: RxStatus.loading());
      change(first, status: RxStatus.success());
    });
    return result;
  }
}
