import 'dart:async';

import 'package:flutter_js_communication/utils/ad_helper.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HomeController extends GetxController {
  RxBool isLoading = false.obs;
  RxString title = 'Flutter JS Communication'.obs;

  final Completer<WebViewController> controller =
      Completer<WebViewController>();
  late WebViewController webViewController;

  late BannerAd bannerAd;
  RxBool isBannerAdReady = false.obs;

  initBannerAd() {
    bannerAd = BannerAd(
      size: AdSize.banner,
      adUnitId: AdHelper.bannerAdUnitId,
      listener: BannerAdListener(
          onAdLoaded: (_) => isBannerAdReady(true),
          onAdFailedToLoad: (ad, err) {
            print("Failed to load a banner ad : ${err.message}");
            isBannerAdReady(false);
            ad.dispose();
          }),
      request: AdRequest(),
    );
    bannerAd.load();
  }
}
