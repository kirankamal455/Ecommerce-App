import 'package:calzada/app/core/theme/app_colors.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/cartpage_controller.dart';

class CartpageView extends GetView<CartpageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: Icon(Icons.card_giftcard, color: green),
        centerTitle: true,
        title: Text('Cart',
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: green)),
        backgroundColor: cream,
        elevation: 5,
        // automaticallyImplyLeading: false,
      ),
      body: controller.obx(
        (cartProductData) => cartProductData != null
            ? Column(
                children: [
                  Expanded(
                    child: ListView.separated(
                        itemCount: cartProductData.length,
                        separatorBuilder: (BuildContext context, int index) =>
                            const Divider(
                              thickness: 6,
                            ),
                        itemBuilder: (BuildContext context, int index) {
                          var cartProductDatas = cartProductData[index];

                          return Container(
                            height: 60,
                            child: Row(children: [
                              Container(
                                height: 70,
                                width: 70,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      scale: 2,
                                      image: NetworkImage(
                                          cartProductDatas.p.image)),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(cartProductDatas.p.title),
                              SizedBox(
                                width: 30,
                              ),
                              Text('Quantity :${cartProductDatas.quantity}'),
                              SizedBox(
                                width: 10,
                              ),
                              IconButton(
                                onPressed: () {
                                  controller.deleteCart(id: index);
                                  controller.getAllCartDetails();
                                },
                                icon: Icon(
                                  Icons.remove_circle,
                                  color: Colors.red,
                                ),
                              ),
                            ]),
                          );
                        }),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'TOTAL  ${5000}',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: Text('CHECKOUT'),
                        ),
                      ],
                    ),
                  )
                ],
              )
            : const Center(child: Text("No students")),
        onLoading: const Center(child: CircularProgressIndicator()),
        onEmpty: const Text('No data found'),
        onError: (error) => Center(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '$error',
                  style: TextStyle(color: Colors.red, fontSize: 20),
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    controller.getAllCartDetails();
                  },
                  child: Text('Retry'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
