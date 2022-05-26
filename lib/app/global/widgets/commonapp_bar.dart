import 'package:calzada/app/core/theme/app_colors.dart';
import 'package:calzada/app/global/controller/global_controller.dart';
import 'package:calzada/app/modules/home/controllers/home_controller.dart';

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class CommonAppBar extends GetView<HomeController> {
  CommonAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
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
        SizedBox(width: 25),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.search, color: green),
        ),
        IconButton(
            onPressed: () {
              Get.toNamed('/categories');
            },
            icon: Icon(Icons.menu),
            color: green),
        CustomCartCount()
      ],
      automaticallyImplyLeading: false,
    );
  }
}

class CustomCartCount extends StatelessWidget {
  final int? listlength;
  const CustomCartCount({
    Key? key,
    this.listlength,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalController controller = Get.put(GlobalController());
    var length = listlength;
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 150.0,
        width: 40.0,
        child: GestureDetector(
          onTap: () {
            Get.toNamed('/cartpage');
          },
          child: Stack(
            children: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.shopping_cart,
                  color: green,
                ),
                onPressed: null,
              ),
              length == 0
                  ? Container()
                  : Positioned(
                      child: Stack(
                        children: <Widget>[
                          Icon(Icons.brightness_1, size: 20.0, color: green),
                          Positioned(
                            top: 4,
                            right: 6,
                            child: Center(
                              child: Obx(
                                () => Text(
                                  "${controller.items}",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 11.0,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
