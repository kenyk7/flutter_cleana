import 'package:flutter_cleana/src/modules/users/users_data_api.dart';
import 'package:flutter_cleana/src/modules/users/users_data_local.dart';
import 'package:flutter_cleana/src/modules/users/users_repository.dart';
import 'package:get/get.dart';

class MainBindings extends Bindings {
  @override
  void dependencies() {
    // Get.lazyPut<UsersRepository>(() => UsersDataLocal());
    Get.lazyPut<UsersRepository>(() => UsersDataApi());
  }
}
