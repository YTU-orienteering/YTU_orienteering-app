import 'package:deneme_17_ekim/domain/constants/constants.dart';
import 'package:deneme_17_ekim/pages/content_pages/articles.dart';
import 'package:deneme_17_ekim/pages/content_pages/compass_use.dart';
import 'package:deneme_17_ekim/pages/content_pages/control_definitions.dart';
import 'package:deneme_17_ekim/pages/content_pages/control_definitions_example.dart';
import 'package:deneme_17_ekim/pages/content_pages/faq.dart';
import 'package:deneme_17_ekim/pages/content_pages/links.dart';
import 'package:deneme_17_ekim/pages/content_pages/trainings.dart';
import 'package:deneme_17_ekim/pages/content_pages/what_is_orienteering.dart';
import 'package:deneme_17_ekim/widgets/drawer.dart';
import 'package:flutter/material.dart';

class OrienteeringPage extends StatefulWidget {
  const OrienteeringPage({Key? key}) : super(key: key);

  @override
  _OrienteeringPageState createState() => _OrienteeringPageState();
}

class _OrienteeringPageState extends State<OrienteeringPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 8,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(DrawerDefinitions.orienteering),
          bottom: const TabBar(
            isScrollable: true,
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
            SingleChildScrollView(child: WhatIsOrienteering()),
            SingleChildScrollView(child: ControlDefinitions()),
            SingleChildScrollView(child: ControlDefinitionsExample()),
            SingleChildScrollView(child: CompassUse()),
            SingleChildScrollView(child: Articles()),
            SingleChildScrollView(child: Links()),
            SingleChildScrollView(child: Trainings()),
            SingleChildScrollView(child: FAQ())
          ],
        ),
      ),
    );
  }
}
