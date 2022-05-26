import 'package:calzada/app/data/models/cart_product_model.dart';
import 'package:calzada/app/data/repository/shop/i_shop_repository.dart';
import 'package:get/get.dart';

import '../../../data/models/product_model.dart';

class CartpageController extends GetxController
    with StateMixin<List<CartProductModel>> {
  IShopRepository shopRepository;
  CartpageController({required this.shopRepository});

  @override
  void onInit() async {
    await getAllCartDetails();
    super.onInit();
  }

  Future<void> getAllCartDetails() async {
    List<dynamic> productids = [];
    // List<int> productquantity = [];
    // print(productquantity);
    var result = await shopRepository.getAllCart();
    result.when((error) {
      print('Error');
      change(null, status: RxStatus.error(error.toString()));
    }, (carts) async {
      var productcartmodels = <CartProductModel>[];
      carts?.forEach((cart) async {
        List prodidlist = cart.products.map((e) => e.productId).toList();
        prodidlist.forEach((element) {
          productids.add(element);
        });
        List prodquantitylist = cart.products.map((e) => e.quantity).toList();

        for (var i = 0; i < prodidlist.length; i++) {
          int currentid = prodidlist[i];

          ///   get all products by their ids
          var currentproduct = await getSingleproduct(id: currentid);
          var currentproductquantity = prodquantitylist[i];
          if (currentproduct != null) {
            ///make a list of cart product model from the products you get by id and their respective quantity
            var productcartmodel = CartProductModel(
                p: currentproduct, quantity: currentproductquantity);
            productcartmodels.add(productcartmodel);
          }
        }
        change(productcartmodels, status: RxStatus.success());
      });
    });
  }

  Future<void> addTocart(
      {required String userId,
      required String date,
      required String productId,
      required String quantity}) async {
    var result = await shopRepository.addProductToCart(
        productId: productId, quantity: quantity, date: date, userId: userId);

    result.when((error) {
      print('Error');

      change(null, status: RxStatus.error(error.toString()));
    }, (cart) {
      getAllCartDetails();
    });
  }

  Future<void> deleteCart({required int id}) async {
    var result = await shopRepository.deleteACart(id: id);
    print(result);
    result.when((error) {
      print('Error');
      change(null, status: RxStatus.error(error.toString()));
    }, (cart) {
      getAllCartDetails();
    });
  }

  Future<Product?> getSingleproduct({required int id}) async {
    var result = await shopRepository.getSingleProduct(id: id);
    if (result.isSuccess()) {
      return result.getSuccess();
    } else {
      return null;
    }
  }
}
