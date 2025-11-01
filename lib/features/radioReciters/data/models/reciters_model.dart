class RecitersModel 
{
  final String recitersName;
  final String recitersSoundUrl;

  RecitersModel({required this.recitersName, required this.recitersSoundUrl});
   factory RecitersModel.fromJson(Map<String, dynamic> json) {
    return RecitersModel(
      recitersName: json['name'],
       recitersSoundUrl: json['url'],);  // 
  } 

}