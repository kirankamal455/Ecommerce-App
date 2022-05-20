import 'package:calzada/app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/firstpage_controller.dart';

class FirstpageView extends GetView<FirstpageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: cream,
        elevation: 0,
        actions: [
          SizedBox(
            width: 10,
          ),
          Icon(Icons.card_giftcard, color: green),
          SizedBox(width: 160),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
            color: green,
          ),
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.menu), color: green),
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.shopping_cart),
              color: green)
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 25),
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 100),
              Text(
                'Calzada',
                style: TextStyle(
                    fontSize: 40, fontWeight: FontWeight.bold, color: green),
              ),
              SizedBox(height: 20),
              Text(
                'A Walk-in-a-park online shopping\n experience!',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 35),
              Container(
                height: 44,
                width: 145,
                child: ElevatedButton(
                    onPressed: () {
                      Get.toNamed('/home');
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                    child: Text(' Shop Now!')),
              )
            ],
          ),
        ),
      ),
    );
  }
}
