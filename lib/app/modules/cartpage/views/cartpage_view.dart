import 'package:calzada/app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/cartpage_controller.dart';

class CartpageView extends GetView<CartpageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.card_giftcard, color: green),
        centerTitle: true,
        title: Text('Cart',
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: green)),
        backgroundColor: cream,
        elevation: 0.0,
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Text(
          'CartpageView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
