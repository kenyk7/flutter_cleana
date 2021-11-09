import 'package:get/get.dart';

import 'package:flutter_cleana/src/ui/users/users_ctrl.dart';

class UsersBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UsersCtrl(
          usersRepository: Get.find(),
        ));
  }
}
