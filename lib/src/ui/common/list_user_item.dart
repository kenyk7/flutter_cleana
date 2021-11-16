import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flutter_cleana/src/modules/users/user_model.dart';
import 'package:flutter_cleana/src/ui/users/users_ctrl.dart';

class ListUserItem extends StatelessWidget {
  const ListUserItem({
    Key? key,
    required this.user,
  }) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(user.name),
      subtitle: Text(user.email),
      trailing: IconButton(
        onPressed: () {
          final usersCtrl = Get.find<UsersCtrl>();
          usersCtrl.toggleFav(user);
        },
        icon: const Icon(Icons.favorite),
        color: user.isFav ? Colors.red : null,
      ),
    );
  }
}
