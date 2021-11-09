import 'package:flutter/material.dart';
import 'package:flutter_cleana/src/theme_ctrl.dart';
import 'package:flutter_cleana/src/ui/common/list_user_item.dart';
import 'package:flutter_cleana/src/ui/users/users_ctrl.dart';
import 'package:get/get.dart';

class ConfigView extends StatelessWidget {
  const ConfigView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final usersCtrl = Get.find<UsersCtrl>();
    final themeCtrl = Get.find<ThemeCtrl>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configuraciones'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            title: const Text('Theme dark mode'),
            trailing: Obx(
              () => Switch(
                value: themeCtrl.isDarkMode.value,
                onChanged: (val) {
                  final theme = val ? ThemeMode.dark : ThemeMode.light;
                  themeCtrl.setThemeMode(theme);
                },
              ),
            ),
          ),
          if (usersCtrl.usersObs.isNotEmpty) const Divider(),
          if (usersCtrl.usersObs.isNotEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text('Mis favoritos',
                  style: Theme.of(context).textTheme.headline6),
            ),
          Obx(
            () => Column(
              children: usersCtrl.usersObs
                  .map((user) => ListUserItem(user: user))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
