class RadioModel 
{
  final String radioName;
  final String radioSoundUrl;

  RadioModel({required this.radioName, required this.radioSoundUrl});
 
  factory RadioModel.fromJson(Map<String, dynamic> json) {
    return RadioModel(
      radioName: json['name'],
       radioSoundUrl: json['url'],);  // 
  } 
}