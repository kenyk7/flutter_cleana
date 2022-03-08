import 'package:get/get.dart';

import 'package:flutter_cleana/src/ui/home_view.dart';
import 'package:flutter_cleana/src/ui/products/products_view.dart';
import 'package:flutter_cleana/src/ui/users/users_binding.dart';
import 'package:flutter_cleana/src/ui/users/users_view.dart';

class AppPages {
  static final pages = [
    GetPage(name: '/', page: () => const HomeView()),
    GetPage(
      name: '/products',
      page: () => const ProductsView(),
      binding: UsersBinding(),
    ),
    GetPage(
      name: '/users',
      page: () => const UsersView(),
      binding: UsersBinding(),
    ),
  ];
}
