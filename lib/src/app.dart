import 'package:flutter/material.dart';
import 'package:flutter_cleana/src/env.dart';
import 'package:get/get.dart';

import 'app_navigation.dart';
import 'main_bindings.dart';
import 'theme_ctrl.dart';
import 'themes.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ThemeCtrl());
    return GetMaterialApp(
      debugShowCheckedModeBanner: env.appEnv == 'dev',
      title: 'Joinnus',
      theme: Themes.light,
      darkTheme: Themes.dark,
      initialRoute: '/users',
      getPages: AppPages.pages,
      initialBinding: MainBindings(),
    );
  }
}
