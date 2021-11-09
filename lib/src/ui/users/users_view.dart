import 'package:flutter/material.dart';
import 'package:flutter_cleana/src/ui/common/list_user_item.dart';
import 'package:flutter_cleana/src/ui/config/config_view.dart';
import 'package:flutter_cleana/src/ui/users/users_ctrl.dart';
import 'package:get/get.dart';

class UsersView extends GetWidget<UsersCtrl> {
  const UsersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // use controller widget
        title: Obx(() => Text('Users ${controller.counter}')),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () => Get.to(ConfigView()),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: GetBuilder<UsersCtrl>(
          id: 'users',
          builder: (ctrl) {
            return Column(
              children:
                  ctrl.users.map((user) => ListUserItem(user: user)).toList(),
            );
          },
        ),
      ),
    );
  }
}
