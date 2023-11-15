import 'package:deneme_17_ekim/pages/content_pages/articles.dart';
import 'package:deneme_17_ekim/pages/content_pages/compass_use.dart';
import 'package:flutter/material.dart';
import 'package:deneme_17_ekim/widgets/drawer.dart';
import 'package:deneme_17_ekim/domain/constants/constants.dart';
import 'package:deneme_17_ekim/pages/content_pages/control_definitions.dart';
import 'package:deneme_17_ekim/pages/content_pages/control_definitions_example.dart';
import 'package:deneme_17_ekim/pages/content_pages/faq.dart';
import 'package:deneme_17_ekim/pages/content_pages/links.dart';
import 'package:deneme_17_ekim/pages/content_pages/trainings.dart';
import 'package:deneme_17_ekim/pages/content_pages/what_is_orienteering.dart';

class OrienteeringPage extends StatefulWidget {
  const OrienteeringPage({Key? key}) : super(key: key);

  @override
  _OrienteeringPageState createState() => _OrienteeringPageState();
}

class _OrienteeringPageState extends State<OrienteeringPage> {
  int _currentIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentIndex);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 8, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          title: Text(DrawerDefinitions.orienteering),
          bottom: TabBar(
            isScrollable: true, // Set this to true if tabs don't fit
            tabs: [
              Tab(text: 'Oryantiring Nedir?'),
              Tab(text: 'Kontrol Tanımları'),
              Tab(text: 'Kontrol Tanımları - Örnekler'),
              Tab(text: 'Pusula Kullanımı'),
              Tab(text: 'Yazılar'),
              Tab(text: 'Bağlantılar'),
              Tab(text: 'Eğitimler'),
              Tab(text: 'SSS'),
            ],
          ),
        ),
        drawer: const MyDrawer(),
        body: TabBarView(
          children: [
            // Replace these with your actual content widgets
            WhatIsOrienteering(),
            ControlDefinitions(),
            ControlDefinitionsExample(),
            CompassUse(),
            Articles(),
            Links(),
            Trainings(),
            FAQ()
          ],
        ),
      ),
    );
  }
}
