import 'package:calzada/app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: cream,
        elevation: 0.0,
        actions: [
          Icon(Icons.card_giftcard, color: green),
          SizedBox(
            width: 20,
          ),
          Center(
              child: Text(
            'Calzada',
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: green),
          )),
          SizedBox(width: 86),
          IconButton(onPressed: () {}, icon: Icon(Icons.search, color: green)),
          IconButton(onPressed: () {}, icon: Icon(Icons.menu), color: green),
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.shopping_cart),
              color: green)
        ],
        automaticallyImplyLeading: false,
      ),
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
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 300,
                      childAspectRatio: 3 / 4,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10),
                  itemCount: 100,
                  itemBuilder: (BuildContext ctx, index) {
                    return InkWell(
                      child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              scale: 2,
                              image: AssetImage(
                                  "assets/images/washingmachine.png"),
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
                                          'Washing Machine',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 13),
                                        ),
                                        Row(
                                          children: [
                                            Text('3',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 10)),
                                            Icon(
                                              Icons.star,
                                              color: Colors.yellow,
                                              size: 13,
                                            ),
                                            SizedBox(
                                              width: 3,
                                            ),
                                            Text(
                                              'Appliances',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14,
                                                  color: Colors.grey),
                                            ),
                                            SizedBox(
                                              width: 15,
                                            ),
                                            Text(
                                              'P96.00',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14,
                                                  color: Colors.blue),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ))
                            ],
                          )),
                      onTap: () {
                        Get.toNamed('/secondpage');
                      },
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
