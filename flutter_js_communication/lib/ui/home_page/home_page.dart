import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_js_communication/controller/home_controller.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Completer<WebViewController> _controller =
        Completer<WebViewController>();
    late WebViewController _webViewController;

    return GetX<HomeController>(
      initState: (state) {
        if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
      },
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: Text(_.title.value),
        ),
        body: Stack(
          children: [
            WebView(
              initialUrl: 'https://js-flutter-communication.herokuapp.com',
              javascriptMode: JavascriptMode.unrestricted,
              onWebViewCreated: (WebViewController webViewController) {
                _controller.complete(webViewController);
                _webViewController = webViewController;
              },
              onProgress: (int progress) {
                _.isLoading(true);
                print("WebView is loading (progress : $progress%)");
                if (progress == 100) _.isLoading(false);
              },
              javascriptChannels: <JavascriptChannel>{
                _javascriptChannel(context),
              },
              navigationDelegate: (NavigationRequest request) {
                if (request.url.startsWith('https://www.youtube.com/')) {
                  print('blocking navigation to $request}');
                  return NavigationDecision.prevent;
                }
                print('allowing navigation to $request');
                return NavigationDecision.navigate;
              },
              onPageStarted: (String url) {
                print('Page started loading: $url');
                _.isLoading(true);
              },
              onPageFinished: (String url) {
                print('Page finished loading: $url');
                _.isLoading(false);
              },
              gestureNavigationEnabled: true,
            ),
            _.isLoading.value
                ? Center(
                    child: CircularProgressIndicator(
                      color: Colors.blue.shade800,
                    ),
                  )
                : const SizedBox.shrink(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _webViewController.runJavascript(
                "showAlert('Hello Web, This is from mobile 🖐')");
          },
          child: const Icon(
            Icons.web,
          ),
        ),
      ),
    );
  }

  JavascriptChannel _javascriptChannel(BuildContext context) {
    return JavascriptChannel(
      name: 'Interface',
      onMessageReceived: (JavascriptMessage message) {
        var payload = jsonDecode(message.message);

        Get.defaultDialog(
          title: payload['param1'],
          titlePadding: const EdgeInsets.all(10.0),
          content: Text(
            payload['param2'],
            textAlign: TextAlign.center,
          ),
          contentPadding: const EdgeInsets.all(20.0),
        );
      },
    );
  }
}
