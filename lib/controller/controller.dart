import 'package:dictionary/model/model.dart';
import 'package:get/get.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';

class Dataget extends GetxController {
  // ignore: deprecated_member_use

  AudioPlayer audioPlayer = AudioPlayer();

  playMusic(url) async {
    await audioPlayer.play(url);
  }

  pauseMusic(url) async {
    await audioPlayer.pause();
  }

  var myFetchdata = List<Dictionary>();

  updateData(value) {
    myFetchdata = value;

    update();
  }

  @override
  void onClose() {
    audioPlayer.release();
    audioPlayer.dispose();
    // searchcontroller.clear();
    // TODO: implement onClose
    super.onClose();
  }
}
