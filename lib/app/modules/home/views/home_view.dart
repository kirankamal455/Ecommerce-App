import 'package:calzada/app/core/theme/app_colors.dart';

import 'package:calzada/app/global/widgets/app_bar.dart';
import 'package:calzada/app/global/widgets/custom_rating_bar.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: controller.obx(
            (products) => products != null
                ? CustomAppBar(productList: products)
                : Text("No Products"),
          )),
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Container(
            //   child: Text(l
            //     'Appliances Department',
            //     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            //   ),
            // ),
            SizedBox(
              height: 5,
            ),
            Expanded(
              child: controller.obx(
                (shopData) => shopData != null
                    ? GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                                maxCrossAxisExtent: 300,
                                childAspectRatio: 3 / 4,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10),
                        itemCount: shopData.length,
                        itemBuilder: (BuildContext ctx, index) {
                          // CustomAppBar.listdata(productList: shopData);
                          var shopDatas = shopData[index];
                          return GestureDetector(
                            child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  scale: 1,
                                  image:
                                      NetworkImage(shopDatas.image, scale: 12),
                                ),
                                color: Colors.white,
                                // borderRadius: BorderRadius.circular(15)
                              ),
                              child: Stack(
                                children: [
                                  Positioned(
                                    bottom: 6,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 8),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            shopDatas.title,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 10),
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                  shopDatas.rating.rate
                                                      .toString(),
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 7)),
                                              CustomRatingBar(
                                                value: shopDatas.rating.rate,
                                                size: 12,
                                              ),
                                              SizedBox(
                                                width: 3,
                                              ),
                                              Text(
                                                shopDatas.category,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 10,
                                                    color: Colors.grey),
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                shopDatas.price.toString(),
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 8,
                                                    color: green),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            onTap: () {
                              Get.toNamed('/secondpage',
                                  arguments: shopDatas.id);
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
                              controller.getProduct();
                            },
                            child: Text('Retry')),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
