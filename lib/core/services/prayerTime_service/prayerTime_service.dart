import 'package:dio/dio.dart';
import 'package:intl/intl.dart';
import 'package:islami/features/time/data/models/prayer_model.dart';

class PrayertimeService {
  final Dio dio;
  PrayertimeService({required this.dio});

  // API base URL
  final String baseUrl = 'https://api.aladhan.com/v1/timingsByCity/';

  Future<PrayerModel> getPrayersTime() async {                               // method returns one PrayModel object not list 
    // تنسيق التاريخ لصيغة dd-MM-yyyy  // عشان يتعرف عليه ال API
    final String formattedDate = DateFormat('dd-MM-yyyy').format(DateTime.now());

    final String url =
        '$baseUrl$formattedDate?city=cairo&country=Egypt&method=5';        

    try {
      final Response response = await dio.get(url);

      if (response.statusCode == 200) {
        // الـ API بيرجع كائن واحد داخل data
        final data = response.data['data'];
        return PrayerModel.fromJson(data);
      } else {
        throw Exception('Failed to fetch prayer times: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching prayer times: $e');
    }
  }
}
