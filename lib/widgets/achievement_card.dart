import 'package:deneme_17_ekim/domain/constants/constants.dart';
import 'package:flutter/material.dart';

class AchievementCard extends StatelessWidget {
  final String photoUrl;
  final String date;
  final String city;
  final String category;
  final String rank;

  const AchievementCard({super.key,
    required this.photoUrl,
    required this.date,
    required this.city,
    required this.category,
    required this.rank
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Card(
      margin: EdgeInsets.all(screenWidth * 0.02),
      child: Column(
        children: <Widget>[
          Image.network(photoUrl, height: screenHeight*0.2, width: double.infinity, fit: BoxFit.fill),
          ListTile(
            title: Text("${AchievementDefinitions.date}: $date"),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${AchievementDefinitions.city}: $city'),
                Text('${AchievementDefinitions.category}: $category'),
                Text('${AchievementDefinitions.rank}: $rank'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}