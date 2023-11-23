import 'package:flutter/material.dart';
import 'package:widget_zoom/widget_zoom.dart';

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
          child: Center(
            child: WidgetZoom(
              heroAnimationTag: 'tag',
              zoomWidget: Image.asset(imagePaths[index]),
            ),
          ),
        );
      },
    );
  }
}
