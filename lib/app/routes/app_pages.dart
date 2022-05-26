import 'package:get/get.dart';

import '../modules/cartpage/bindings/cartpage_binding.dart';
import '../modules/cartpage/views/cartpage_view.dart';
import '../modules/categories/bindings/categories_binding.dart';
import '../modules/categories/views/categories_view.dart';
import '../modules/categoryproduct/bindings/categoryproduct_binding.dart';
import '../modules/categoryproduct/views/categoryproduct_view.dart';
import '../modules/firstpage/bindings/firstpage_binding.dart';
import '../modules/firstpage/views/firstpage_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/search/bindings/search_binding.dart';
import '../modules/search/views/search_view.dart';
import '../modules/secondpage/bindings/secondpage_binding.dart';
import '../modules/secondpage/views/secondpage_view.dart';

// ignore_for_file: constant_identifier_names

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.CATEGORIES;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.FIRSTPAGE,
      page: () => FirstpageView(),
      binding: FirstpageBinding(),
    ),
    GetPage(
      name: _Paths.SECONDPAGE,
      page: () => SecondpageView(),
      binding: SecondpageBinding(),
    ),
    GetPage(
      name: _Paths.CARTPAGE,
      page: () => CartpageView(),
      binding: CartpageBinding(),
    ),
    GetPage(
      name: _Paths.SEARCH,
      page: () => SearchView(),
      binding: SearchBinding(),
    ),
    GetPage(
      name: _Paths.CATEGORIES,
      page: () => CategoriesView(),
      binding: CategoriesBinding(),
    ),
    GetPage(
      name: _Paths.CATEGORYPRODUCT,
      page: () => CategoryproductView(),
      binding: CategoryproductBinding(),
    ),
  ];
}
