import 'package:dio/dio.dart';
import 'package:islami/features/radio/data/models/radio_model.dart';

class RadioService {
  final Dio dio;
  RadioService({required this.dio});

  Future<List<RadioModel>> getRadio() async {
    // https://www.mp3quran.net/api/v3/radios?language=ar   // url without api key
    final String baseUrl = 'https://www.mp3quran.net/api/v3/radios';

    try {
  final Response response = await dio.get('$baseUrl?language=ar');
  
  final List<RadioModel> radios = (response.data["radios"] as List)//"radios" is a key in map to access Data
      .map((e) => RadioModel.fromJson(e)).toList(); 
  // .map((e) => RadioModel.fromJson(e)).toList();    يمر علي كل  عنصر في الماب ويحولها ل RadioModel
  
  return radios; 
} on Exception catch (e) {
  throw Exception('Error occurred: $e');
}
//list of RadioModel
  }
}
