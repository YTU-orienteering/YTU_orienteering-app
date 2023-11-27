import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class WhatIsOrienteering extends StatelessWidget {
  Future<String> loadAsset(String path) async {
    return await rootBundle.loadString(path);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            FutureBuilder(
              future: loadAsset('assets/orienteering/ori1.txt'),
              builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return Text(snapshot.data ?? 'Metin yüklenemedi.');
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
            SizedBox(height: 16.0),
            Image.asset(
              'assets/orienteering/orienteering.png',
              fit: BoxFit.cover,
            ),
            SizedBox(height: 16.0),
            FutureBuilder(
              future: loadAsset('assets/orienteering/ori2.txt'),
              builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return Text(snapshot.data ?? 'İkinci metin yüklenemedi.');
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
