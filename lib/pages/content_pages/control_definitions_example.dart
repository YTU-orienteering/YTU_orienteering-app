import 'package:flutter/material.dart';
import 'package:widget_zoom/widget_zoom.dart';

class ControlDefinitionsExample extends StatelessWidget {
  ControlDefinitionsExample({super.key});
  final List<String> imagePaths = [
    'assets/orienteering/ex1.PNG',
    'assets/orienteering/ex2.PNG',
    'assets/orienteering/ex3.PNG',
    'assets/orienteering/ex4.PNG',
    'assets/orienteering/ex5.PNG',
    'assets/orienteering/ex6.PNG',
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
