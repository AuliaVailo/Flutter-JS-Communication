import 'dart:developer';

import 'package:flutter_js_communication/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class SplashController extends GetxController {
  RxString loadingString = ''.obs;
  RxString developer = 'MahaTech@2021 \nby Moh. Abdul Haq Aulia'.obs;
  initDate() async {
    loadingString('Now loading....');
    // await Future.delayed(const Duration(seconds: 2));
    await initGoogleMobileAds();
    loadingString('');
    Get.offAndToNamed(Routes.HOME);
  }

  Future<InitializationStatus> initGoogleMobileAds() {
    return MobileAds.instance.initialize();
  }
}
