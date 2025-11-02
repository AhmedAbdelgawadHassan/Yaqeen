class PrayerModel {
  final String weekday;
  final String fajr;
  final String dhuhr;
  final String asr;
  final String maghrib;
  final String ishaa;
  final String gregorianDate; // التاريخ الميلادي
  // مش بيوفرلي التاريخ الهجري كله علي بعضه زي التاريخ الميلادي api
  final String hijriDay;  // اليوم الهجري
  final String hijriMonth; // الشهر الهجري 
  final String hijriYear; // السنة الهجرية

  PrayerModel({
    required this.weekday,
    required this.fajr,
    required this.dhuhr,
    required this.asr,
    required this.maghrib,
    required this.ishaa,
    required this.gregorianDate,
    required this.hijriDay,
    required this.hijriMonth,
    required this.hijriYear,
  });

  // factory costructor
  factory PrayerModel.fromJson(Map<String, dynamic> json) {
    return PrayerModel(
      weekday: json['date']['gregorian']['weekday']['en'],
      fajr: json['timings']['Fajr'],
      dhuhr: json['timings']['Dhuhr'],
      asr: json['timings']['Asr'],
      maghrib: json['timings']['Maghrib'],
      ishaa: json['timings']['Isha'],
      gregorianDate: json['date']['readable'],
      hijriDay: json['date']['hijri']['day'],
      hijriMonth: json['date']['hijri']['month']['en'],
      hijriYear: json['date']['hijri']['year'],
    );
  }
}
