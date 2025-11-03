import 'package:dio/dio.dart';
import 'package:islami/features/radioReciters/data/models/reciters_model.dart';

class RecitersService {
  final Dio dio = Dio();
  final String baseUrl = 'https://www.mp3quran.net/api/v3/reciters';

  Future<List<ReciterModel>> fetchReciters() async {
    try {
      final Response response = await dio.get(
        baseUrl,
        queryParameters: {'language': 'ar'},
      );

      if (response.statusCode == 200) {
        final data = response.data as Map<String, dynamic>;
        final reciters = (data['reciters'] as List)
            .map((e) => ReciterModel.fromJson(e))    // make each element in list to ReciterModel
            .toList();
        return reciters;
      } else {
        throw Exception('Failed to load reciters: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching reciters: $e');
    }
  }
}
