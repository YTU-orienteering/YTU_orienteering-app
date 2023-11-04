import 'package:flutter/material.dart';

import '../domain/constants/constants.dart';
import '../pages/about_us.dart';
import '../pages/achievements.dart';
import '../pages/athlete.dart';
import '../pages/event_calender.dart';
import '../pages/results.dart';
import '../service/firebaseService.dart';

class MyDrawerItem extends StatelessWidget {
  final String text;
  final Widget destination;

  const MyDrawerItem({super.key,
    required this.text,
    required this.destination,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(text),
      onTap: () {
        Navigator.pop(context); // Çekmeceyi kapat
        Navigator.push(context, MaterialPageRoute(builder: (context) => destination));
      },
    );
  }
}

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    final appBarHeight = AppBar().preferredSize.height;
    final statusBarHeight = MediaQuery.of(context).padding.top; // Durum çubuğu (status bar) yüksekliği

    return Drawer(
      width: screenWidth * 0.5,
      backgroundColor: Colors.orange,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          SizedBox(
            height: appBarHeight + statusBarHeight,
            child: const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(DrawerDefinitions.menu),
            ),
          ),
          MyDrawerItem(
            text: DrawerDefinitions.activityCalender,
            destination: EventCalendarPage(firebaseService: FirebaseService()),
          ),
          MyDrawerItem(
            text: DrawerDefinitions.results,
            destination: ResultsPage(firebaseService: FirebaseService()),
          ),
          const MyDrawerItem(
            text: DrawerDefinitions.achievements,
            destination: AchievementsPage(),
          ),
          const MyDrawerItem(
            text: DrawerDefinitions.aboutUs,
            destination: AboutPage(),
          ),
          MyDrawerItem(
            text: DrawerDefinitions.athletes,
            destination: AthletePage(firebaseService: FirebaseService()),
          ),
        ],
      ),
    );
  }
}


