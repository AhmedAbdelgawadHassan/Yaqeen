import 'package:audioplayers/audioplayers.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:islami/core/services/radio_service/radio_service.dart';
import 'package:islami/features/radioReciters/data/models/radio_model.dart';
import 'package:islami/features/radioReciters/widgets/radio_item.dart';

class RadioBody extends StatefulWidget {
  const RadioBody({super.key});

  @override
  State<RadioBody> createState() => _RadioBodyState();
}

class _RadioBodyState extends State<RadioBody> {
  final AudioPlayer audioPlayer = AudioPlayer();
  bool isPlaying = false;
  String? currentUrl; // لتحديد الإذاعة الحالية

  final RadioService radioService = RadioService(dio: Dio());

  Future<List<RadioModel>> getRadio() async => await radioService.getRadio();

  void _togglePlay(String url) async {
    if (isPlaying && currentUrl == url) {
      await audioPlayer.pause();
      setState(() {
        isPlaying = false;
      });
    } else {
      await audioPlayer.stop();
      await audioPlayer.play(UrlSource(url));
      setState(() {
        isPlaying = true;
        currentUrl = url;
      });
    }
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<RadioModel>>(
      future: getRadio(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return const Center(
            child: Text(
              "حدث خطأ أثناء تحميل الإذاعات 😢",
              style: TextStyle(color: Colors.red),
            ),
          );
        }

        final radios = snapshot.data ?? [];

        if (radios.isEmpty) {
          return const Center(
            child: Text(
              "لا توجد إذاعات متاحة الآن 📻",
              style: TextStyle(color: Colors.white70),
            ),
          );
        }

        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Column(
              children: List.generate(
                radios.length,
                (index) {
                  final radio = radios[index];
                  final isThisPlaying =
                      isPlaying && currentUrl == radio.radioSoundUrl;

                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: RadioItem(
                      onPressed: () => _togglePlay(radio.radioSoundUrl),
                      radioModel: radio,
                      isPlaying: isThisPlaying,
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
