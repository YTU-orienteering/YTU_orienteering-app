import 'package:deneme_17_ekim/domain/model/results.dart';

List<Results> resultDtoToResults(List<dynamic> resultsDto) {
  List<Results> results = [];
  int size = resultsDto.length;
  for(var i=0; i<size; i++){
    Results result = Results(resultsDto[i]['ADI SOYADI']!, resultsDto[i]['ETKINLIK YERI']!,
        resultsDto[i]['KULUBU']!, resultsDto[i]['PARKUR']!, resultsDto[i]['PARKUR UZUNLUGU']!,
        resultsDto[i]['SURE']!, resultsDto[i]['TARIH']!);
    results.add(result);
  }
  return results;
}