import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:permission_handler/permission_handler.dart';

class PlayerController extends GetxController {


  //   @override
  // void onInit() {
  //   // TODO: implement onInit
  //   super.onInit();
  //   checkpermission();
  // }

  
  final audioStroge = OnAudioQuery();
  final audioplayerr = AudioPlayer();

  var playindex = 0.obs;
  var isPlaying = false.obs;
  var duration = ''.obs;
  var position = ''.obs;

  var max = 0.0.obs;
  var value = 0.0.obs;

  updationSong() {
    audioplayerr.durationStream.listen((d) {
      duration.value = d.toString().split(".")[0];
      max.value = d!.inSeconds.toDouble();
    });
    audioplayerr.positionStream.listen((p) {
      position.value = p.toString().split(".")[0];
      value.value = p.inSeconds.toDouble();
    });
  }

  

  playmusic(String? music, index) {
    playindex.value = index;
    try {
      audioplayerr.setAudioSource(
        AudioSource.uri(
          Uri.parse(music!),
          tag: MediaItem(id: "", title: 'title')
        ),
      );
      audioplayerr.play();
      isPlaying(true);
      updationSong();
    } on Exception catch (e) {
      print(e.toString());
    }
  }

  palysong(double value, double slide) async {
    slide = await value;
    var duration = audioplayerr.duration!.inMilliseconds;
    audioplayerr.seek(Duration(milliseconds: (value * duration).round()));
  }

  void playAudioSlide(seconds) async {
    var duration = Duration(seconds: seconds);
    audioplayerr.seek(duration);
  }


}
