import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:html' as html; // Only for Web

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HtmlPage(),
    );
  }
}

class HtmlPage extends StatelessWidget {
  const HtmlPage({super.key});

  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      // On Web: open the HTML in a new browser tab
      html.window.open('public/index.html', '_blank');
      return Scaffold(
        body: Center(
          child: Text(
            'Your wedding invitation opened in a new tab!',
            textAlign: TextAlign.center,
          ),
        ),
      );
    } else {
      // On Mobile: use WebView
      final controller = WebViewController()
        ..loadFlutterAsset('public/index.html');

      return Scaffold(
        body: WebViewWidget(controller: controller),
      );
    }
  }
}
