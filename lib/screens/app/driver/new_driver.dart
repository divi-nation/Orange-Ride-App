import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class NewDriverPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Driver Portal'),
      ),
      body: InAppWebView(
        initialUrlRequest: URLRequest(url: Uri.parse('https://www.google.com')),
        initialOptions: InAppWebViewGroupOptions(
          crossPlatform: InAppWebViewOptions(
            javaScriptEnabled: true,
            userAgent: "Mozilla/5.0 ...", // Set a user agent if needed
          ),
        ),
      ),
    );
  }
}
