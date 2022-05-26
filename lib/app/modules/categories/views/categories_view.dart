import 'package:calzada/app/core/theme/app_colors.dart';

import 'package:calzada/app/modules/home/controllers/home_controller.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/categories_controller.dart';

class CategoriesView extends GetView<CategoriesController> {
  final HomeController homeController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // leading: Icon(Icons.card_giftcard, color: green),
          centerTitle: true,
          title: Text('Categories',
              style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold, color: green)),
          backgroundColor: cream,
          elevation: 5,
          // automaticallyImplyLeading: false,
        ),
        body: controller.obx(
          (product) => product != null
              ? GridView.builder(
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 300,
                      childAspectRatio: 3 / 4,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10),
                  itemCount: 4,
                  itemBuilder: (BuildContext ctx, index) {
                    // var shopDatas = shopData[index];
                    String k = product[index];
                    return GestureDetector(
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          // borderRadius: BorderRadius.circular(15)
                        ),
                        child: Text(product[index]),
                      ),
                      onTap: () {
                        Get.toNamed('/categoryproduct', arguments: k);
                      },
                    );
                  })
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
                        controller.getallCatergories();
                      },
                      child: Text('Retry')),
                ],
              ),
            ),
          ),
        ));
  }
}
