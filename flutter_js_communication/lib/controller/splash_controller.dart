import 'dart:developer';

import 'package:flutter_js_communication/routes/app_pages.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  RxString loadingString = ''.obs;
  RxString developer = 'MahaTech@2021 \nby Moh. Abdul Haq Aulia'.obs;
  initDate() async {
    loadingString('Now loading....');
    await Future.delayed(const Duration(seconds: 2));
    loadingString('');
    Get.offAndToNamed(Routes.HOME);
  }
}
