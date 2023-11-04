import 'package:deneme_17_ekim/domain/constants/constants.dart';
import 'package:deneme_17_ekim/widgets/drawer.dart';
import 'package:flutter/material.dart';

import '../widgets/app_bar.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  final List<String> imageUrls = [
    'assets/about_us/ytu37kb.png',
    'assets/about_us/3.jpg',
    'assets/about_us/ytuseffaf52kb.png',
  ];

  int _currentIndex = 0;
  PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentIndex);
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: getAppBarHeight(DrawerDefinitions.aboutUs),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              width: screenWidth,
              height: screenWidth,
              child: PageView.builder(
                controller: _pageController,
                itemCount: imageUrls.length,
                itemBuilder: (context, index) {
                  return Image.asset(
                    imageUrls[index],
                    fit: BoxFit.fill,
                  );
                },
                onPageChanged: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
              ),
            ),
            Row(
              children: [
                if (_currentIndex > 0)
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.red),
                    onPressed: () {
                      _pageController.previousPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
                  ),
                const Spacer(),
                if (_currentIndex < imageUrls.length - 1)
                  IconButton(
                    icon: const Icon(Icons.arrow_forward, color: Colors.green),
                    onPressed: () {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
                  ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(screenWidth * 0.04),
              child: const Text(
                AboutUsDefinitions.text + AboutUsDefinitions.text1 + AboutUsDefinitions.text + AboutUsDefinitions.text1,
                style: TextStyle(
                  fontSize: 18.0,
                ),
                textAlign: TextAlign.left,
              ),
            ),
          ],
        ),
      ),
      drawer: const MyDrawer(),
    );
  }
}
