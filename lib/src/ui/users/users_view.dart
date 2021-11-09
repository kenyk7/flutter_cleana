import 'package:flutter/material.dart';
import 'package:flutter_cleana/src/ui/common/app_loading.dart';
import 'package:flutter_cleana/src/ui/common/list_user_item.dart';
import 'package:flutter_cleana/src/ui/config/config_view.dart';
import 'package:flutter_cleana/src/ui/users/users_ctrl.dart';
import 'package:get/get.dart';

class UsersView extends GetView<UsersCtrl> {
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
        child: Obx(() {
          if (controller.loading.value) {
            return const Padding(
              padding: EdgeInsets.all(15.0),
              child: Center(child: AppLoading()),
            );
          }
          return GetBuilder<UsersCtrl>(
            id: 'users',
            builder: (ctrl) {
              return ctrl.users.isEmpty
                  ? const Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Center(
                        child: Text('No data'),
                      ),
                    )
                  : Column(
                      children: ctrl.users
                          .map((user) => ListUserItem(user: user))
                          .toList(),
                    );
            },
          );
        }),
      ),
    );
  }
}
