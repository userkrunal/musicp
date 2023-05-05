import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/foundation.dart';

class MusicProvider extends ChangeNotifier
{
  AssetsAudioPlayer assetsAudioPlayer=AssetsAudioPlayer();
  bool isplay=false;
  Duration musicduration=Duration(seconds: 0);

  initMusic()
  {
    assetsAudioPlayer.open(
      showNotification: true,
      autoStart: false,
      Playlist(
        audios: [
          Audio("assets/audio/kgf.mp3"),
          Audio("assets/audio/guj.mp3"),
        ],
      ),loopMode: LoopMode.playlist
    );
    audioduration();
  }
  playmusic()
  {
    isplay= false;
    assetsAudioPlayer.play();
    notifyListeners();
  }
  stopmusic()
  {
    isplay=true;
    assetsAudioPlayer.pause();
    notifyListeners();
  }
  nextmusic()
  {
     assetsAudioPlayer.next();
     notifyListeners();
  }
  permusic()
  {
    assetsAudioPlayer.previous();
    notifyListeners();
  }
  audioduration()
  {
    assetsAudioPlayer.current.listen((event) {
      musicduration=event!.audio.duration;
    });
  }
}