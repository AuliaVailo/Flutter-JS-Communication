import 'dart:io';

class AdHelper {
  static String get bannerAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-5238990376915091/6601456467';
    } else {
      throw UnsupportedError('Unsupported platform');
    }
  }

  // static String get bannerAdUnitId {
  //   if (Platform.isAndroid) {
  //     return 'ca-app-pub-5238990376915091/6601456467';
  //   } else if (Platform.isIOS) {
  //     return 'ca-app-pub-5238990376915091/6601456467';
  //   } else {
  //     throw UnsupportedError('Unsupported platform');
  //   }
  // }

  // static String get interstitialAdUnitId {
  //   if (Platform.isAndroid) {
  //     return 'ca-app-pub-5238990376915091/6601456467';
  //   } else if (Platform.isIOS) {
  //     return 'ca-app-pub-5238990376915091/6601456467';
  //   } else {
  //     throw UnsupportedError('Unsupported platform');
  //   }
  // }

  // static String get rewardedAdUnitId {
  //   if (Platform.isAndroid) {
  //     return 'ca-app-pub-5238990376915091/6601456467';
  //   } else if (Platform.isIOS) {
  //     return 'ca-app-pub-5238990376915091/6601456467';
  //   } else {
  //     throw UnsupportedError('Unsupported platform');
  //   }
  // }
}
