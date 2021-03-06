import 'package:calzada/app/data/models/product_model.dart';

import 'package:calzada/app/global/controller/global_controller.dart';
import 'package:calzada/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:calzada/app/core/theme/app_colors.dart';
import 'package:search_page/search_page.dart';

class CustomAppBar extends GetView<HomeController> {
  CustomAppBar({Key? key, required this.productList}) : super(key: key);
  // CustomAppBar.listdata({required List<Product> productList});
  final List<Product> productList;

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
          onPressed: () {
            showSearch(
              context: context,
              delegate: SearchPage<Product>(
                items: productList,
                searchLabel: 'Search Product',
                suggestion: Center(
                  child: Text('Filter product by name'),
                ),
                failure: Center(
                  child: Text('No Product found :('),
                ),
                filter: (item) => [
                  item.title,
                  item.price.toString(),
                ],
                builder: (item) => GestureDetector(
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(item.image, scale: 12),
                    ),
                    title: Text('Product Name :${item.title}'),
                    subtitle: Text('Price:${item.price.toString()}'),
                  ),
                  onTap: () {
                    Get.toNamed('/secondpage', arguments: item.id);
                  },
                ),
              ),
            );
          },
          icon: Icon(Icons.search, color: green),
        ),
        PopupMenuButton(
            icon: Icon(
              Icons.sort,
              color: green,
            ),
            itemBuilder: (context) => [
                  PopupMenuItem(
                    child: Text("Desc"),
                    value: 1,
                    onTap: () {
                      controller.sortProduct();
                    },
                  ),
                  PopupMenuItem(
                    child: Text("Asc"),
                    value: 2,
                    onTap: () {
                      controller.getProduct();
                    },
                  )
                ]),
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
