import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Links extends StatelessWidget {
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          ExpansionTile(
            title: Text('Bilgilendirme'),
            initiallyExpanded: true,
            backgroundColor: Colors.orange,
            children: <Widget>[
              ListTile(
                title: Text('IOG'),
                onTap: () => _openLink(context,'https://www.iog.org.tr/'),
              ),
            ],
          ),
          ExpansionTile(
            title: Text('Kısayollar'),
            initiallyExpanded: true,
            children: <Widget>[
              ListTile(
                title: Text('IOG Kayıt'),
                onTap: () => _openLink(context,'https://www.iog.org.tr/results.asp'),
              ),
              ListTile(
                title: Text('IOG Buluşma Yerleri'),
                onTap: () => _openLink(context,'https://www.google.com/maps/d/u/0/viewer?mid=148qAOtpNTeeFhWqh2qldvbQM_VU&ll=41.03955993960201%2C28.924467200000006&z=11'),
              ),
            ],
          ),
          ExpansionTile(
            title: Text('Haritalar'),
            initiallyExpanded: true,
            backgroundColor: Colors.orange,
            children: <Widget>[
              ListTile(
                title: Text('Worldofo'),
                onTap: () => _openLink(context,'http://omaps.worldofo.com/'),
              ),
            ],
          ),
          ExpansionTile(
            title: Text('Eğitim'),
            initiallyExpanded: true,
            children: <Widget>[
              ListTile(
                title: Text('Oryantiring Bilgi Bankası'),
                onTap: () => _openLink(context,'https://www.iog.org.tr/archive/egitim/'),
              ),
            ],
          ),
          ExpansionTile(
            title: Text('Oyunlar'),
            initiallyExpanded: true,
            backgroundColor: Colors.orange,
            children: <Widget>[
              ListTile(
                title: Text('Oryantiring Bilgi Oyunu'),
                onTap: () => _openLink(context,'https://wordwall.net/tr/resource/14327157/oryantiring'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Function to open a new screen with a WebView
  void _openLink(BuildContext context, String url) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => WebViewScreen(url: url)));
  }
}

class WebViewScreen extends StatelessWidget {
  final String url;

  WebViewScreen({required this.url});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Web'),
      ),
      body: WebView(
        initialUrl: url,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
