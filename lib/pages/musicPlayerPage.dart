import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:medak/getxmodel/playercontroller.dart';

import 'package:on_audio_query/on_audio_query.dart';

class Musicplaypage extends StatefulWidget {
  Musicplaypage({
    this.songname,
    super.key,
  });
  final List<SongModel>? songname;

  @override
  State<Musicplaypage> createState() => _MusicplaypageState();
}

class _MusicplaypageState extends State<Musicplaypage> {
  final controlplay = Get.put(PlayerController());
  @override
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[300],
      
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                'images/bbbb3.jpg',
              ),
              fit: BoxFit.cover),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 250,
            ),
            Center(
              child: Stack(
                children: [
                  Container(
                    height: 400,
                    width: 330,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 255, 255, 255).withOpacity(.4),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: 300,
                          height: 200,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('images/bbbb2.jpg')),
                              borderRadius: BorderRadius.circular(40)),
                        ),
                        Obx(
                          () => Center(
                              child: Text(
                            widget.songname![controlplay.playindex.value]
                                .displayNameWOExt,
                                overflow: TextOverflow.fade,
                            maxLines: 1,
                            style: GoogleFonts.alumniSans(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          )),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 4.0, right: 4),
                          child: Obx(
                            () => Row(
                              children: [
                                Text(controlplay.position.value),
                                Expanded(child: GetBuilder<PlayerController>(
                                    builder: (controlplay) {
                                  return Slider(
                                      activeColor:Color.fromARGB(255, 48, 226, 72),
                                      inactiveColor:
                                          Color.fromARGB(255, 14, 14, 14),
                                      thumbColor:
                                          Color.fromARGB(255, 48, 226, 72),
                                      value: controlplay.value.value,
                                      min: Duration(seconds: 0)
                                          .inSeconds
                                          .toDouble(),
                                      max: controlplay.max.value,
                                      onChanged: (newValue) {
                                        controlplay
                                            .playAudioSlide(newValue.toInt());
                                        newValue = newValue;
                                      });
                                })),
                                Text(controlplay.duration.value)
                              ],
                            ),
                          ),
                        ),
                        Obx(
                          () => Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              RotatedBox(
                                  quarterTurns: 2,
                                  child: GestureDetector(
                                    onTap: () {controlplay.playindex.value=     controlplay.playindex.value-1;
                                      controlplay.playmusic(
                                          widget
                                              .songname![
                                                  controlplay.playindex.value]
                                              .uri,
                                          controlplay.playindex.value );
                                    },
                                    child: Image.asset(
                                      'images/b1.png',
                                      width: 60,
                                    ),
                                  )),

                              IconButton(
                                  onPressed: () {
                                    controlplay.isPlaying.value =
                                        !controlplay.isPlaying.value;
                                    if (controlplay.isPlaying == true) {
                                      controlplay.audioplayerr.play();
                                    } else {
                                      controlplay.audioplayerr.pause();
                                    }
                                  },
                                  icon: controlplay.isPlaying == false
                                      ? Icon(
                                          Icons.play_circle,
                                          size: 80, color: Colors.black,
                                        )
                                      : Icon(
                                          Icons.pause,
                                          size: 80,color: Color.fromARGB(255, 76, 199, 67),
                                        ),
                                        
                                        
                                        ),

                          
                              GestureDetector(
                                onTap: () {    controlplay.playindex.value=     controlplay.playindex.value+1;
                                  controlplay.playmusic(
                                      widget
                                          .songname![
                                              controlplay.playindex.value]
                                          .data,
                                      controlplay.playindex.value);
                                  
                                },
                                child: Image.asset(
                                  'images/b1.png',
                                  width: 60,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
