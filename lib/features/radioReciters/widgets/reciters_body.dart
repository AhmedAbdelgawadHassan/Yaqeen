import 'package:flutter/material.dart';
import 'package:islami/core/services/reciters_service/reciters_service.dart';
import 'package:islami/features/radioReciters/data/models/reciters_model.dart';
import 'package:islami/features/radioReciters/widgets/reciters_item.dart';


class RecitersBody extends StatefulWidget {
  const RecitersBody({super.key});

  @override
  State<RecitersBody> createState() => _RecitersBodyState();
}

class _RecitersBodyState extends State<RecitersBody> {
  RecitersService recitersService=RecitersService();
 late Future<List<ReciterModel>>futureReciters;

@override
  void initState() {
    futureReciters=recitersService.fetchReciters();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: futureReciters,   // in future we call the method (Api request )
      builder:(context, snapshot) {    //in builder we display the UI with data
      if(snapshot.hasError){
        return const Center(child: Text('حدث خطاء'),);
      }
      else if(snapshot.connectionState==ConnectionState.waiting)  // if data is loading
      {
        return const Center(child: CircularProgressIndicator(),);
      } 
       final reciters = snapshot.data!;  // if data is loaded correctly (store it in reciters list)
      return  Expanded(
        child: ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: 20,
          itemBuilder: (context, index) {
          return  Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: RecitersItem(
              reciterModel:reciters[index]  ,)
          );
        },),
      );
  });
  }
}