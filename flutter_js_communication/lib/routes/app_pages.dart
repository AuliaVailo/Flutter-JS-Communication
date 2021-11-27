import 'package:flutter_js_communication/binding/home_binding.dart';
import 'package:flutter_js_communication/binding/splash_binding.dart';
import 'package:flutter_js_communication/ui/home_page/home_page.dart';
import 'package:flutter_js_communication/ui/splash_screen/splash_screen.dart';
import 'package:get/get.dart';
part './app_routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.SPLASH,
      page: () => const SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.HOME,
      page: () => const HomePage(),
      binding: HomeBinding(),
      transition: Transition.cupertino,
    ),
  ];
}
