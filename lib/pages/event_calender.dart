import 'package:cached_network_image/cached_network_image.dart';
import 'package:deneme_17_ekim/domain/constants/constants.dart';
import 'package:flutter/material.dart';

import '../service/firebaseService.dart';
import '../widgets/app_bar.dart';
import '../widgets/drawer.dart';

class EventCalendarPage extends StatefulWidget {
  final FirebaseService firebaseService;

  const EventCalendarPage({super.key, required this.firebaseService});

  @override
  _EventCalendarPageState createState() => _EventCalendarPageState();
}

class _EventCalendarPageState extends State<EventCalendarPage> {
  String? imageUrl;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadPhotoUrl();
  }

  Future<void> _loadPhotoUrl() async {
    try {
      await widget.firebaseService.init();
      final url = ResultDefinitions.driveUrl +
          await widget.firebaseService.getMainPagePhotoId();
      setState(() {
        imageUrl = url;
        isLoading = false;
      });
    } catch (e) {
      print("hata : $e");
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: getAppBarHeight(DrawerDefinitions.activityCalender),
      body: Center(
        child: isLoading
            ? const CircularProgressIndicator()
            : imageUrl != null
                ? CachedNetworkImage(
                    imageUrl: imageUrl!,
                    width: screenWidth * 0.85,
                    height: screenHeight * 0.8,
                    fit: BoxFit.fill,
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                  )
                : Container(), // Hata durumunda veya veri yoksa hiçbir şey gösterme
      ),
      drawer: const MyDrawer(),
      backgroundColor: Colors.orange,
    );
  }
}
