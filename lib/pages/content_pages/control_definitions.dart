import 'package:flutter/material.dart';

class ControlDefinitions extends StatelessWidget {
  ControlDefinitions({super.key});
  final List<String> imagePaths = [
    'assets/orienteering/control_definitions.jpg',
    'assets/orienteering/symbols.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: imagePaths.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            imagePaths[index],
            fit: BoxFit.cover,
          ),
        );
      },
    );
  }
}
