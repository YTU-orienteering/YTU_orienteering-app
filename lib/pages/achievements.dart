import 'package:flutter/material.dart';

import '../domain/constants/constants.dart';
import '../service/firebaseService.dart';
import '../widgets/achievement_card.dart';
import '../widgets/app_bar.dart';
import '../widgets/drawer.dart';

class AchievementsPage extends StatelessWidget {
  const AchievementsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBarHeight(DrawerDefinitions.achievements),
      body: ListView(children: buildAchievementCards()),
      drawer: const MyDrawer(),
      backgroundColor: Colors.orange,
    );
  }

  List<Widget> buildAchievementCards() {
    List achievementList = FirebaseService.achievements;
    List<Widget> list = [];
    for(var achievement in achievementList){
      list.add(AchievementCard(
        photoUrl: ResultDefinitions.driveUrl + achievement[AchievementDefinitions.driveId],
        date: achievement[AchievementDefinitions.day],
        city: achievement[AchievementDefinitions.location],
        category: achievement[AchievementDefinitions.parkur],
        rank: achievement[AchievementDefinitions.degree]
      ));
    }
    return list;
  }
}
