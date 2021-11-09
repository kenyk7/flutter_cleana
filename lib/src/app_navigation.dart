import 'package:flutter_cleana/src/ui/users/users_binding.dart';
import 'package:flutter_cleana/src/ui/users/users_view.dart';
import 'package:get/get.dart';

class AppPages {
  static final pages = [
    GetPage(name: '/users', page: () => UsersView(), binding: UsersBinding()),
  ];
}
