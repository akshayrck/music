import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medak/getxmodel/playercontroller.dart';



class Srhpage extends StatefulWidget {
  const Srhpage ({super.key});

  @override
  State<Srhpage> createState() => _SrhpageState();
}

class _SrhpageState extends State<Srhpage> {
  TextEditingController _textEditingController = TextEditingController();
  final getcontrl= Get.put(PlayerController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      body: Column(
        children: [
          SizedBox(
            height: 80,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Container(
                  width: 250,
                  height: 60,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20), ),
                         child: Padding(
                           padding: const EdgeInsets.only(left:10.0),
                           child: Center(
                             child: TextField(
                              controller: _textEditingController,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                              ),
                             ),
                           ),
                         ), ),
                SizedBox(
                  width: 10,
                ),
                FloatingActionButton( backgroundColor: Colors.greenAccent,
                  onPressed: () {
                    
                  },
                  child: Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          // FutureBuilder<List<SongModel>>(future: getcontrl.audioStroge.querySongs(),
          //  builder: (context, items){
          //   if(items.data!=_textEditingController){
          //     return Center(child:  Text('No songs found'),);
          //   }
          //   return ListView.builder(itemCount: items.data!.length,
          //     itemBuilder:(context,index){
          //       return ListTile(
          //         title: Text(items.data![index].displayNameWOExt),

                  

          //       );

          //     } );
          //  }
          //  )
        ],
      ),
    );
  }
}
