import 'package:flutter/material.dart';
import 'package:flutter_js_communication/controller/splash_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<SplashController>(
      initState: (state) => Get.find<SplashController>().initDate(),
      builder: (_) => Scaffold(
        body: Container(
          width: Get.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Image.asset(
                  'assets/images/logo.png',
                  height: 100,
                  width: 100,
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Text(_.loadingString.value),
              const Spacer(),
              Text(
                _.developer.value,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 20.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
