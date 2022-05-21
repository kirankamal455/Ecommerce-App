import 'package:calzada/app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:get/get.dart';

import '../controllers/secondpage_controller.dart';

class SecondpageView extends GetView<SecondpageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: cream,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(left: 4),
            child: Icon(Icons.card_giftcard, color: green),
          ),
          SizedBox(
            width: 20,
          ),
          Center(
              child: Text(
            'Calzada',
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: green),
          )),
          SizedBox(width: 70),
          IconButton(onPressed: () {}, icon: Icon(Icons.search, color: green)),
          IconButton(onPressed: () {}, icon: Icon(Icons.menu), color: green),
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.shopping_cart),
              color: green)
        ],
        automaticallyImplyLeading: false,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(4),
            child: Container(
              height: 350,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                image: DecorationImage(
                  scale: 2,
                  image: AssetImage("assets/images/washingmachine.png"),
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
                  Text('Brand-new speaker',
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
                      Text('466 Sold | 44 Stock Left '),
                    ],
                  ),
                  Text(
                    'P96.00',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Colors.green),
                  ),
                  RatingBar.builder(
                    initialRating: 3,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding: EdgeInsets.symmetric(horizontal: 0),
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {
                      print(rating);
                    },
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
                      print("You pressed Icon Elevated Button");
                    },
                    icon: Icon(
                        Icons.shopping_cart), //icon data for elevated button
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
          Text('The Apollotech B340')
        ],
      ),
    );
  }
}
