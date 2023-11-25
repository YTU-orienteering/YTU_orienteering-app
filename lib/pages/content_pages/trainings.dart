import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class Trainings extends StatelessWidget {
  late final InAppWebViewController? webViewController1;
  late final InAppWebViewController? webViewController2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      body: ListView(
        children: [
          const SizedBox(height: 16),
          SizedBox(
            height: 300, // Belirli bir yükseklik
            child: InAppWebView(
              initialUrlRequest: URLRequest(
                url: Uri.parse('https://www.youtube.com/embed/zmNNxdLBaf8'),
              ),
              onWebViewCreated: (controller) {
                webViewController1 = controller;
              },
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 300, // Belirli bir yükseklik
            child: InAppWebView(
              initialUrlRequest: URLRequest(
                url: Uri.parse('https://www.youtube.com/embed/P6EtYMHL7Wc'),
              ),
              onWebViewCreated: (controller) {
                webViewController2 = controller;
              },
            ),
          ),
        ],
      ),
    );
  }
}
