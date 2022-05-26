import 'package:calzada/app/core/theme/app_colors.dart';
import 'package:calzada/app/global/widgets/commonapp_bar.dart';
import 'package:calzada/app/modules/cartpage/controllers/cartpage_controller.dart';
import 'package:intl/intl.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/secondpage_controller.dart';

class SecondpageView extends GetView<SecondpageController> {
  final CartpageController cartpageController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: CommonAppBar(),
        ),
        body: controller.obx(
          (shopData) => shopData != null
              ? ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(4),
                      child: Container(
                        height: 350,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            scale: 1,
                            image: NetworkImage(shopData.image, scale: 6),
                          ),
                          color: Colors.white,
                          // borderRadius: BorderRadius.circular(15)
                        ),
                      ),
                    ),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20, top: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(shopData.title.toString(),
                                style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: green)),
                            SizedBox(
                              width: 4,
                            ),
                            Text('Appliances - Speaker'),
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                  size: 13,
                                ),
                                SizedBox(
                                  width: 4,
                                ),
                                // Text('466 Sold | 44 Stock Left '),
                              ],
                            ),
                            Text(
                              shopData.price.toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                  color: Colors.green),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: Row(
                          children: <Widget>[
                            Text('Quantity : '),
                            Container(
                              height: 40,
                              color: creamDark,
                              child: IconButton(
                                icon: Icon(
                                  Icons.remove,
                                  size: 20,
                                ),
                                onPressed: () {
                                  controller.decrement();
                                  print('Count is : ${controller.count}');
                                },
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Container(
                              child: Obx(
                                () => Text(
                                  " ${controller.count}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25,
                                      color: Colors.black),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Container(
                              height: 40,
                              color: Colors.green,
                              child: IconButton(
                                icon: Icon(
                                  Icons.add,
                                  size: 20,
                                ),
                                color: Colors.white,
                                onPressed: () {
                                  controller.increment();
                                  print('Count is : ${controller.count}');
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: ElevatedButton.icon(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(creamDark),
                              ),
                              onPressed: () {
                                var now = DateTime.now();
                                var formatter = DateFormat('yyyy-MM-dd');
                                String formattedDate = formatter.format(now);
                                print(formattedDate);
                                cartpageController.addTocart(
                                    productId: shopData.id.toString(),
                                    userId: '1',
                                    date: formattedDate,
                                    quantity: controller.count.toString());
                                Get.toNamed('/cartpage');
                              },
                              icon: Icon(Icons
                                  .shopping_cart), //icon data for elevated button
                              label: Text("Add To cart"), //label text
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: ElevatedButton.icon(
                              onPressed: () {
                                print("You pressed Icon Elevated Button");
                              },
                              icon: Icon(
                                Icons.lock,
                              ), //icon data for elevated button
                              label: Text("Buy Now"), //label text
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(shopData.description)
                  ],
                )
              : const Center(child: Text("No product")),
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
                        controller.getEachProduct();
                      },
                      child: Text('Retry')),
                ],
              ),
            ),
          ),
        ));
  }
}
