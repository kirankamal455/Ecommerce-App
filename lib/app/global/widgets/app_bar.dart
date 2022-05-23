import 'package:calzada/app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  CustomAppBar({
    Key? key,
  }) : super(key: key);
  @override
  Size get preferredSize => Size.fromHeight(60);

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
        SizedBox(width: 86),
        IconButton(
            onPressed: () {
              // controller.getProduct();
            },
            icon: Icon(Icons.search, color: green)),
        IconButton(onPressed: () {}, icon: Icon(Icons.menu), color: green),
        CustomCartCount()
      ],
      automaticallyImplyLeading: false,
    );
  }
}

class CustomCartCount extends StatelessWidget {
  const CustomCartCount({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var length = 7;
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
                                child: Text(
                                  // list. length.toString();
                                  length.toString(),
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 11.0,
                                      fontWeight: FontWeight.w500),
                                ),
                              )),
                        ],
                      )),
              ],
            ),
          )),
    );

    //IconButton(
    //     onPressed: () {
    //       Get.toNamed('/cartpage');
    //     },
    //     icon: const Icon(Icons.shopping_cart),
    //     color: green

    //     );
  }
}
