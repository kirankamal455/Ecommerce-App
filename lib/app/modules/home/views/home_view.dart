import 'package:calzada/app/data/models/shop_model.dart';
import 'package:calzada/app/global/widgets/app_bar.dart';
import 'package:calzada/app/global/widgets/custom_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Text(
                'Appliances Department',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
            ),
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
                          var shopDatas = shopData[index];
                          return GestureDetector(
                            child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  scale: 1,
                                  image:
                                      NetworkImage(shopDatas.image, scale: 6),
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
                                                fontSize: 13),
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                  shopDatas.rating.rate
                                                      .toString(),
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 10)),
                                              CustomRatingBar(
                                                value: shopDatas.rating.rate,
                                                size: 15,
                                              ),
                                              SizedBox(
                                                width: 3,
                                              ),
                                              Text(
                                                shopDatas.category,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 14,
                                                    color: Colors.grey),
                                              ),
                                              SizedBox(
                                                width: 15,
                                              ),
                                              Text(
                                                shopDatas.price.toString(),
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 14,
                                                    color: Colors.blue),
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
