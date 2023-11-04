import 'package:flutter/material.dart';

import '../domain/Mapper/result_dto_to_result_data.dart';
import '../domain/constants/constants.dart';
import '../domain/model/results.dart';
import '../service/firebaseService.dart';
import '../widgets/app_bar.dart';
import '../widgets/drawer.dart';

class ResultsPage extends StatefulWidget {
  final FirebaseService firebaseService;

  const ResultsPage({super.key, required this.firebaseService});

  @override
  _ResultsPageState createState() => _ResultsPageState();
}

class _ResultsPageState extends State<ResultsPage> {
  late String selectedSeason, selectedLocation, selectedCategory;
  String selectedLocationResult = "";
  String selectedCategoryResult = "";
  String distance = "";
  late List<String> seasons, locations, categories;
  List<Results> results = [];
  bool isResultsVisible = false;

  @override
  void initState() {
    super.initState();
    seasons = List<String>.from(widget.firebaseService.getSeasons());
    selectedSeason = seasons[0];
    locations = List<String>.from(widget.firebaseService.getLocations(selectedSeason));
    selectedLocation = locations[0];
    categories = ['YENI', 'KISA', 'ORTA', 'UZUN'];
    selectedCategory = categories[0];
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double dropdownWidth = screenWidth * 0.7;
    double dropdownHeight = screenHeight * 0.07;

    return Scaffold(
      appBar: getAppBarHeight(DrawerDefinitions.results),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 5),
                  SizedBox(
                    width: dropdownWidth,
                    height: dropdownHeight,
                    child: InputDecorator(
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 1.0, horizontal: 12),
                        border: OutlineInputBorder(),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: selectedSeason,
                          items: seasons.map((season) {
                            return DropdownMenuItem<String>(
                              value: season,
                              child: Text(season),
                            );
                          }).toList(),
                          onChanged: (value) async {
                            setState(() {
                              selectedSeason = value!;
                              locations = List<String>.from(widget.firebaseService.getLocations(selectedSeason));
                              selectedLocation = locations[0];
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 2),
                  SizedBox(
                    width: dropdownWidth,
                    height: dropdownHeight,
                    child: InputDecorator(
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 1.0, horizontal: 12),
                        border: OutlineInputBorder(),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: selectedLocation,
                          items: locations.map((location) {
                            return DropdownMenuItem<String>(
                              value: location,
                              child: Text(location),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              selectedLocation = value!;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 2),
                  SizedBox(
                    width: dropdownWidth,
                    height: dropdownHeight,
                    child: InputDecorator(
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 1.0, horizontal: 12),
                        border: OutlineInputBorder(),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: selectedCategory,
                          items: categories.map((category) {
                            return DropdownMenuItem<String>(
                              value: category,
                              child: Text(category),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              selectedCategory = value!;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                showResults();
              },
              child: const Text(ResultDefinitions.show),
            ),
            Visibility(
              visible: isResultsVisible,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "$selectedLocationResult  $selectedCategoryResult  $distance",
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.red, backgroundColor: Colors.black87),
                ),
              ),
            ),
            if (results.isNotEmpty)
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  columns: const [
                    DataColumn(label: Text(ResultDefinitions.order)),
                    DataColumn(label: Text(ResultDefinitions.name)),
                    DataColumn(label: Text(ResultDefinitions.club)),
                    DataColumn(label: Text(ResultDefinitions.totalTime))
                  ],
                  rows: results.map((result) => DataRow(
                    cells: [
                      DataCell(Text((1 + results.indexOf(result)).toString())),
                      DataCell(Text(result.nameSurname)),
                      DataCell(Text(result.clubName)),
                      DataCell(Text(result.totalTime)),
                    ],
                  )).toList(),
                ),
              ),
          ],
        ),
      ),
      drawer: const MyDrawer(),
    );
  }

  Future<void> showResults() async {
    List result = await widget.firebaseService.getFilteredResults(selectedSeason, selectedLocation, selectedCategory);
    setState(() {
      if (result.isEmpty) {
        selectedLocationResult = "Sonuçlar getirilemedi";
        selectedCategoryResult = "";
        distance = "";
      } else {
        selectedLocationResult = selectedLocation.split("/")[0].toUpperCase();
        selectedCategoryResult = selectedCategory;
        results = resultDtoToResults(result);
        distance = results[0].distance;
      }
      isResultsVisible = true;
    });
  }
}
