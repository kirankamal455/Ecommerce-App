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
    var result = await shopRepository.getAllCart();
    result.when((error) {
      print('Error');
      change(null, status: RxStatus.error(error.toString()));
    }, (carts) async {
      var cartproductmodels = <CartProductModel>[];
      carts?.forEach((cart) async {
        List<int> prodidlist = cart.products.map((e) => e.productId).toList();

        print('old proid $prodidlist');
        List<int> prodquantitylist =
            cart.products.map((e) => e.quantity).toList();
        print('old quantity$prodquantitylist');

        // for (var i = 0; i < prodidlist.length; i++) {
        //   int currentid = prodidlist[i];

        //   ///   get all products by their ids
        //   var currentproduct = await getSingleproduct(id: currentid);
        //   var currentproductquantity = prodquantitylist[i];
        //   if (currentproduct != null) {
        //     ///make a list of cart product model from the products you get by id and their respective quantity
        //     var productcartmodel = CartProductModel(
        //         p: currentproduct, quantity: currentproductquantity);
        //     cartproductmodels.add(productcartmodel);
        //   }
        // }

        ///cartproductmodels having same id products ,merge their quantities and remove duplicate products
        /// p(id,quantity)
        /// list-> [p:(1,1),p:(1,2),p:(1,3)] -> [p(1,6)]

        int lengthofprodidlist = prodidlist.length;
        print('lenth 1$lengthofprodidlist');
        int lengthofprodidlisttoset = prodidlist.toSet().length;
        print('toSetlength 2$lengthofprodidlisttoset');

        if (lengthofprodidlist != lengthofprodidlisttoset) {
          for (var i = 0; i <= prodidlist.length; i++) {
            int currentid = prodidlist[i];
            var currentproduct = await getSingleproduct(id: currentid);
            var currentproductquantity = prodquantitylist[i];
            if (currentproduct != null) {
              var productcartmodel = CartProductModel(
                  p: currentproduct, quantity: currentproductquantity);
              cartproductmodels.add(productcartmodel);
              print('cartproductmodels$cartproductmodels');
            }
          }
        } else {
          var initialValue = 0;

          var newprodidlist = prodidlist.toSet().toList();

          print('New proid list$newprodidlist');

          final totalquantity = prodquantitylist.fold<int>(initialValue,
              (previousValue, element) => previousValue + element);
          print('new quantity$totalquantity');
          for (var i = 0; i <= newprodidlist.length; i++) {
            int newcurrentid = newprodidlist[i];
            var newcurrentproduct = await getSingleproduct(id: newcurrentid);

            if (newcurrentproduct != null) {
              var productcartmodel = CartProductModel(
                  p: newcurrentproduct, quantity: totalquantity);
              cartproductmodels.add(productcartmodel);
            }
          }
        }
        change(cartproductmodels, status: RxStatus.success());
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
