import 'package:flutter/material.dart';

class ControlDefinitions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            'assets/orienteering/control_definitions.jpg',
            fit: BoxFit.cover,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            'assets/orienteering/symbols.jpg',
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}
