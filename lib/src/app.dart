import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'env.dart';
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
      title: 'Wine.ur',
      theme: Themes.dark,
      darkTheme: Themes.dark,
      initialRoute: '/',
      getPages: AppPages.pages,
      initialBinding: MainBindings(),
    );
  }
}
