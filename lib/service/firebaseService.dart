import 'dart:convert';

import 'package:deneme_17_ekim/domain/constants/constants.dart';
import 'package:deneme_17_ekim/repository/firebaseRepository.dart';

class FirebaseService{
    static List result = [];
    static List result1 = [];
    static List members = [];
    static List seasonsName = [];
    static List achievements = [];
    static Map locationsOfSeasons = {};
    static String activityCalenderId = "";
    FirebaseRepository firebaseRepository = FirebaseRepository();
    static int count = 0;

    init() async {
        count++;
        print("init count : $count");
        if(count == 1){
            DateTime baslangicZamani = DateTime.now();
            //result1 = await firebaseRepository.read("Results/2014_2015", "") as List;
            //deneme();
            //achievements = await firebaseRepository.read("Achievements", "") as List;
            await firebaseRepository.initializeFirebase();
            locationsOfSeasons = await firebaseRepository.read("Season","") as Map;
            seasonsName = locationsOfSeasons.keys.toList();
            seasonsName.sort((a, b) => b.compareTo(a));
            members = locationsOfSeasons[seasonsName[0]];
            achievements = locationsOfSeasons[seasonsName[1]];
            seasonsName.removeAt(0);
            seasonsName.removeAt(0);
            //members = await firebaseRepository.read("Members", "") as List;
            DateTime finishZamani = DateTime.now();
            Duration calismaSuresi = finishZamani.difference(baslangicZamani);
            print('init Methodun çalışma süresi: ${calismaSuresi.inMilliseconds} milisaniye');
        }
    }

    void deneme() {
        List<Map<String, String>> veriler = [
            {
                "ADI SOYADI": "KUBRA EREN",
                "ETKINLIK YERI": "ValideBendi/24-05-2015",
                "KULUBU": "",
                "PARKUR": "KISA",
                "PARKUR UZUNLUGU": "3,2 km 160 m",
                "SURE": "1:11:18",
                "TARIH": "24-05-2015"
            },
            {
                "ADI SOYADI": "MUGE YILMAZ",
                "ETKINLIK YERI": "ValideBendi/24-05-2015",
                "KULUBU": "",
                "PARKUR": "KISA",
                "PARKUR UZUNLUGU": "3,2 km 160 m",
                "SURE": "1:12:40",
                "TARIH": "24-05-2015"
            },
            {
                "ADI SOYADI": "MERVE DENIZ HEREK",
                "ETKINLIK YERI": "ValideBendi/24-05-2015",
                "KULUBU": "",
                "PARKUR": "KISA",
                "PARKUR UZUNLUGU": "3,2 km 160 m",
                "SURE": "1:19:11",
                "TARIH": "24-05-2015"
            },
            {
                "ADI SOYADI": "MERVE DENIZ HEREK",
                "ETKINLIK YERI": "ValideBendi/24-05-2015",
                "KULUBU": "",
                "PARKUR": "KISA",
                "PARKUR UZUNLUGU": "3,2 km 160 m",
                "SURE": "1:19:11",
                "TARIH": "24-05-2015"
            }
        ];

        Map<String, Map<Object?, Object?>> uniqueEntries = {};
        List list = [];
        for (var entry in result1) {
            // JSON entry'sini birleşik bir String'e dönüştür
            String entryString = json.encode(entry);

            // Benzersiz entry'leri tespit et
            if (!uniqueEntries.containsKey(entryString)) {
                uniqueEntries[entryString] = entry;
                list.add(entry);
            } else {
                // Eğer aynı entry daha önce eklenmişse, bu bir dublikasyondur.
                print("Dublikasyon bulundu: $entryString");
            }
        }
        print("ok");
        Map<String, dynamic> x = list as Map<String, dynamic>;
        firebaseRepository.update("Results/2014_2015", x);
    }

    List getSeasons() {
        return seasonsName;
    }

    List<Object?> getLocations(String season) {
        return locationsOfSeasons[season];
    }

    List<String> getCategories(String location) {
        List<String> categoryList = [];
        for (var data in result) {
            if(data[ResultDefinitions.location] == location){
                categoryList.add(data[ResultDefinitions.category]);
            }
        }
        return categoryList;
    }

    Future<List<Map>> getFilteredResults(String season, String location, String category) async {
        List<Map<dynamic, dynamic>> filteredResult = [];
        DateTime baslangicZamani = DateTime.now();
        result = await firebaseRepository.read(ResultDefinitions.databaseName, season) as List;
        DateTime finishZamani = DateTime.now();
        Duration calismaSuresi = finishZamani.difference(baslangicZamani);
        print('getFilteredResults Methodun çalışma süresi: ${calismaSuresi.inMilliseconds} milisaniye');

        for (var element in result) {
            if(element[ResultDefinitions.location] == location && element[ResultDefinitions.category] == category){
                filteredResult.add(element);
            }
        }
        return filteredResult;
    }

    List getMembers(){
        return members;
    }

    Future<String> getMainPagePhotoId() async {
        activityCalenderId = await firebaseRepository.read("ActivityCalender","") as String;
        return activityCalenderId;
    }


}



