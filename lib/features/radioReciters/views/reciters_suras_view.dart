// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:islami/features/radioReciters/data/models/reciters_model.dart';
import 'package:islami/features/radioReciters/widgets/reciters_sura_textfield.dart';

class RecitersSurasView extends StatefulWidget {
  const RecitersSurasView({super.key, required this.reciterModel});

  final ReciterModel reciterModel;

  @override
  State<RecitersSurasView> createState() => _RecitersSurasViewState();
}

class _RecitersSurasViewState extends State<RecitersSurasView> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  int? _playingSurah;

  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  final List<String> surahNames = [
    "الفاتحة", "البقرة", "آل عمران", "النساء", "المائدة", "الأنعام", "الأعراف", "الأنفال", "التوبة", "يونس",
    "هود", "يوسف", "الرعد", "إبراهيم", "الحجر", "النحل", "الإسراء", "الكهف", "مريم", "طه",
    "الأنبياء", "الحج", "المؤمنون", "النور", "الفرقان", "الشعراء", "النمل", "القصص", "العنكبوت", "الروم",
    "لقمان", "السجدة", "الأحزاب", "سبأ", "فاطر", "يس", "الصافات", "ص", "الزمر", "غافر",
    "فصلت", "الشورى", "الزخرف", "الدخان", "الجاثية", "الأحقاف", "محمد", "الفتح", "الحجرات", "ق",
    "الذاريات", "الطور", "النجم", "القمر", "الرحمن", "الواقعة", "الحديد", "المجادلة", "الحشر", "الممتحنة",
    "الصف", "الجمعة", "المنافقون", "التغابن", "الطلاق", "التحريم", "الملك", "القلم", "الحاقة", "المعارج",
    "نوح", "الجن", "المزمل", "المدثر", "القيامة", "الإنسان", "المرسلات", "النبأ", "النازعات", "عبس",
    "التكوير", "الانفطار", "المطففين", "الانشقاق", "البروج", "الطارق", "الأعلى", "الغاشية", "الفجر", "البلد",
    "الشمس", "الليل", "الضحى", "الشرح", "التين", "العلق", "القدر", "البينة", "الزلزلة", "العاديات",
    "القارعة", "التكاثر", "العصر", "الهمزة", "الفيل", "قريش", "الماعون", "الكوثر", "الكافرون", "النصر",
    "المسد", "الإخلاص", "الفلق", "الناس"
  ];

  Future<void> _togglePlay(String surahUrl, int surahNumber) async {
    if (_playingSurah == surahNumber) {
      await _audioPlayer.pause();
      setState(() => _playingSurah = null);
    } else {
      await _audioPlayer.play(UrlSource(surahUrl));
      setState(() => _playingSurah = surahNumber);
    }
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final moshaf = widget.reciterModel.moshafs.first;
    final surahList = moshaf.surahList.split(',').map(int.parse).toList();

    final filteredSuras = surahList.where((number) {
      final surahName = surahNames[number - 1];
      return surahName.contains(_searchQuery);
    }).toList();

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          widget.reciterModel.name,
          style: const TextStyle(
            color: Colors.amberAccent,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.amberAccent),
      ),
      body: Stack(
        children: [
          // 🌙 خلفية جميلة بخطوط ذهبية ناعمة
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.black, Colors.grey.shade900, Colors.black],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: const AssetImage('assets/images/islamic_pattern.png'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.2),
                  BlendMode.dstATop,
                ),
              ),
            ),
          ),

          Column(
            children: [
              const SizedBox(height: 100),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: RecitersSuraTextfield(
                  searchController: _searchController,
                  onChanged: (value) => setState(() => _searchQuery = value.trim()),
                ),
              ),
              const SizedBox(height: 10),

              Expanded(
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.all(12),
                  itemCount: filteredSuras.length,
                  itemBuilder: (context, index) {
                    final surahNumber = filteredSuras[index];
                    final surahName = surahNames[surahNumber - 1];
                    final surahUrl = moshaf.surahUrl(surahNumber);
                    final isPlaying = _playingSurah == surahNumber;

                    return AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: isPlaying
                              ? [Colors.amberAccent, Colors.orangeAccent]
                              : [Colors.grey.shade900, Colors.black],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(18),
                        boxShadow: [
                          BoxShadow(
                            color: isPlaying
                                ? Colors.amberAccent.withOpacity(0.4)
                                : Colors.black.withOpacity(0.3),
                            blurRadius: 10,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: ListTile(
                        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                        leading: CircleAvatar(
                          radius: 25,
                          backgroundColor:
                              isPlaying ? Colors.black.withOpacity(0.8) : Colors.amber.withOpacity(0.1),
                          child: Text(
                            surahNumber.toString(),
                            style: TextStyle(
                              color: isPlaying ? Colors.amberAccent : Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        title: Text(
                          'سورة $surahName',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: isPlaying ? Colors.black : Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            letterSpacing: 0.5,
                          ),
                        ),
                        trailing: IconButton(
                          icon: Icon(
                            isPlaying
                                ? Icons.pause_circle_filled_rounded
                                : Icons.play_circle_fill_rounded,
                            color: isPlaying ? Colors.black : Colors.amberAccent,
                            size: 46,
                          ),
                          onPressed: () => _togglePlay(surahUrl, surahNumber),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
