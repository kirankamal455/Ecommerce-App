import 'package:get/get.dart';

import 'package:calzada/app/modules/cartpage/bindings/cartpage_binding.dart';
import 'package:calzada/app/modules/cartpage/views/cartpage_view.dart';
import 'package:calzada/app/modules/firstpage/bindings/firstpage_binding.dart';
import 'package:calzada/app/modules/firstpage/views/firstpage_view.dart';
import 'package:calzada/app/modules/home/bindings/home_binding.dart';
import 'package:calzada/app/modules/home/views/home_view.dart';
import 'package:calzada/app/modules/secondpage/bindings/secondpage_binding.dart';
import 'package:calzada/app/modules/secondpage/views/secondpage_view.dart';

// ignore_for_file: constant_identifier_names

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

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
  ];
}
