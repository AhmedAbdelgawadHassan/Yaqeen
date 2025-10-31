import 'package:audioplayers/audioplayers.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:islami/core/services/radio_service/radio_service.dart';
import 'package:islami/features/radio/data/models/radio_model.dart';
import 'package:islami/features/radio/widgets/radio_item.dart';

class RadioBody extends StatefulWidget {
  const RadioBody({super.key});

  @override
  State<RadioBody> createState() => _RadioBodyState();
}

class _RadioBodyState extends State<RadioBody> {
  final AudioPlayer audioPlayer = AudioPlayer();
  bool isPlaying = false;
  String? currentUrl; // لتحديد الإذاعة الحالية

  RadioService radioService = RadioService(dio: Dio());

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
        if (snapshot.hasError) {
          return const Center(child: Text("حدث خطأ أثناء تحميل الإذاعات"));
        }
        final radios = snapshot.data ?? [];
        return Expanded(
          child: ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: radios.length,
            itemBuilder: (context, index) {
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
        );
      },
    );
  }
}
