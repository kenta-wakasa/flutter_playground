import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

import 'my_chrome_safari_browser.dart';
import 'my_http_server.dart';

final localhostServer = MyHttpServer();

class HttpTestController extends ChangeNotifier {
  HttpTestController();

  final browser = MyChromeSafariBrowser(MyInAppBrowser());

  Future<void> testHttp() async {
    await browser.open(
      url: 'http://192.168.11.43:5500/sample_web/index.html',
      options: ChromeSafariBrowserClassOptions(
        android: AndroidChromeCustomTabsOptions(addDefaultShareMenuItem: false),
        ios: IOSSafariOptions(barCollapsingEnabled: true),
      ),
    );
  }

  Future<void> startLocalHostServer() async {
    await localhostServer.start();
    notifyListeners();
  }

  Future<void> closeLocalHostServer() async {
    await localhostServer.close();
    notifyListeners();
  }

  String getServerAddress() {
    var address = localhostServer.address;
    address == null
        ? address = 'サーバーは稼働していません。'
        : address = 'サーバーが $address で稼働中です。';
    return address;
  }
}
