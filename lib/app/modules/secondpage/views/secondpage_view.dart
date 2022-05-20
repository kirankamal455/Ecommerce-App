import 'package:calzada/app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

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
            IconButton(
                onPressed: () {}, icon: Icon(Icons.search, color: green)),
            IconButton(onPressed: () {}, icon: Icon(Icons.menu), color: green),
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.shopping_cart),
                color: green)
          ],
          automaticallyImplyLeading: false,
        ),
        body: Container());
  }
}
