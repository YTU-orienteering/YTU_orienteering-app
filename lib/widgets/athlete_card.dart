import 'package:flutter/material.dart';

import '../domain/model/athlete.dart';

class AthleteCard extends StatelessWidget {
  final Athlete athlete;

  const AthleteCard({super.key, required this.athlete});

  @override
  Widget build(BuildContext context) {
    final cardWidth = MediaQuery.of(context).size.width;
    final cardHeight = MediaQuery.of(context).size.height;

    return Card(
      margin: EdgeInsets.all(cardHeight * 0.003),
      child: Column(
        children: [
          Image.network(
            athlete.photoUrl,
            width: cardWidth,
            height: cardWidth * 0.6,
            fit: BoxFit.fitHeight,
          ),
          ListTile(
            title: Center(
              child: Text(
                athlete.name,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            subtitle: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.cake, size: 18),
                Text(
                  ' ${athlete.birthYear}',
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}