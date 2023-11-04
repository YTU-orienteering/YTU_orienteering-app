import 'package:deneme_17_ekim/domain/constants/constants.dart';
import 'package:deneme_17_ekim/service/firebaseService.dart';
import 'package:flutter/material.dart';

import '../domain/model/athlete.dart';
import '../widgets/app_bar.dart';
import '../widgets/athlete_card.dart';
import '../widgets/drawer.dart';

class AthletePage extends StatefulWidget {
  const AthletePage({super.key, required this.firebaseService});
  final FirebaseService firebaseService;

  @override
  _AthletesPageState createState() => _AthletesPageState();
}

class _AthletesPageState extends State<AthletePage> {
  List members=[];
  List<Athlete> athletes = [];
  String filterName = '';
  int filterBirthYear = 0;

  @override
  void initState() {
    super.initState();
    members = widget.firebaseService.getMembers();
    for(var member in members) {
      athletes.add(
          Athlete(
            name: member[AthletesDefinitions.name],
            photoUrl: ResultDefinitions.driveUrl + member[AthletesDefinitions.driveId],
            birthYear: member[AthletesDefinitions.birthYear]
          )
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: getAppBarHeight(DrawerDefinitions.athletes),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(screenWidth*0.04),
            child: Column(
              children: [
                TextField(
                  decoration: const InputDecoration(labelText: AthletesDefinitions.filterByName),
                  onChanged: (value) {
                    setState(() {
                      filterName = value;
                    });
                  },
                ),
                TextField(
                  decoration: const InputDecoration(labelText: AthletesDefinitions.filterByDate),
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    setState(() {
                      filterBirthYear = int.tryParse(value) ?? 0;
                    });
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.orange,
              child: ListView.builder(
                itemCount: athletes.length,
                itemBuilder: (context, index) {
                  final athlete = athletes[index];
                  if (athlete.name.toLowerCase().contains(filterName.toLowerCase()) &&
                      (filterBirthYear == 0 || athlete.birthYear.toString().contains(filterBirthYear.toString()))) {
                    return AthleteCard(athlete: athlete);
                  }
                  return const SizedBox.shrink(); // Eşleşmeyenleri gizle
                },
              ),
            ),
          ),
        ],
      ),
      drawer: const MyDrawer(),
    );
  }
}

