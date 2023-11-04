import 'package:deneme_17_ekim/pages/event_calender.dart';
import 'package:deneme_17_ekim/service/firebaseService.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []); // Sistem arayüz öğelerini devre dışı bırak
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final FirebaseService firebaseService = FirebaseService();
  MyApp({super.key}) {
    //firebaseService.init();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: EventCalendarPage(firebaseService: FirebaseService()),
    );
  }
}