class ReciterModel {
  final String name;
  final List<MoshafModel> moshafs;

  ReciterModel({
    required this.name,
    required this.moshafs,
  });

  factory ReciterModel.fromJson(Map<String, dynamic> json) {
    return ReciterModel(
      name: json['name'],
      moshafs: (json['moshaf'] as List<dynamic>)
          .map((e) => MoshafModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class MoshafModel {
  final String server;
  final String surahList;

  MoshafModel({
    required this.server,
    required this.surahList,
  });

  factory MoshafModel.fromJson(Map<String, dynamic> json) {
    return MoshafModel(
      server: json['server'],
      surahList: json['surah_list'], // موجود في الـ API
    );
  }

  /// 🔹 Method to get the URL of a specific surah
  String surahUrl(int surahNumber) {
    // بعض السيرفرات لازم أرقام السور تكون مكونة من 3 أرقام (مثلاً 001.mp3)
    final formattedNumber = surahNumber.toString().padLeft(3, '0');
    return '$server$formattedNumber.mp3';
  }
}
