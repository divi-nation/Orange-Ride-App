import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewDriverPage extends StatefulWidget {
  @override
  _NewDriverPageState createState() => _NewDriverPageState();
}

class _NewDriverPageState extends State<NewDriverPage> {
  @override
  void initState() {
    super.initState();
    // Enable hybrid composition (recommended for Android WebView)
    WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Driver Portal'),
      ),
      body: WebView(
        initialUrl: 'https://www.google.com',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
