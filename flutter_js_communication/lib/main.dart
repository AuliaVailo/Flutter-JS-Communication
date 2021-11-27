import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'binding/splash_binding.dart';
import 'routes/app_pages.dart';
import 'ui/splash_screen/splash_screen.dart';
import 'utils/app_theme.dart';

void main() {
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: Routes.SPLASH,
    theme: appThemeData,
    defaultTransition: Transition.fade,
    initialBinding: SplashBinding(),
    getPages: AppPages.pages,
    home: const SplashScreen(),
  ));
}
