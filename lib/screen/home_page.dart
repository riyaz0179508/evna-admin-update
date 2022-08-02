import 'dart:async';
import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}
bool showSpinner = true;
StreamSubscription? subscription;
final Completer<WebViewController> _controller =
Completer<WebViewController>();
class _HomePageState extends State<HomePage> {
  void initState() {
    super.initState();
    subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      if (Platform.isAndroid) {
        WebView.platform = SurfaceAndroidWebView();
      }
    });
  }
  @override
  dispose() {
    super.dispose();

    subscription!.cancel();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: ModalProgressHUD(
            inAsyncCall: showSpinner,
            child: WebView(
              initialUrl: "https://www.evna.care/admin/",
              gestureRecognizers: Set()
                ..add(Factory<HorizontalDragGestureRecognizer>(
                        () => HorizontalDragGestureRecognizer())),
              javascriptMode: JavascriptMode.unrestricted,
              onWebViewCreated: (WebViewController webViewController) {
                _controller.complete(webViewController);
                setState(() {
                  showSpinner= false;
                });},
            ),
          ),
        ));
  }
}
