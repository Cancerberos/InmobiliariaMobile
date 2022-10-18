import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '/routes/app_pages.dart';

Future<void> main() async {
  await GetStorage.init();
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: Routes.avisos,
    theme: ThemeData.light(),
    defaultTransition: Transition.fade,
    getPages: AppPages.pages,
    // home: const SplashPage(),
  ));
}
