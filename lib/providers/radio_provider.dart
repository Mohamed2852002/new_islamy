import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class RadioProvider extends ChangeNotifier {
  final AudioPlayer audioPlayer = AudioPlayer();

  playAudio(String audioUrl) {
    audioPlayer.setUrl(audioUrl);
    audioPlayer.play();
    notifyListeners();
  }

  pauseAudio() {
    audioPlayer.pause();
    notifyListeners();
  }

  muteAudio() {
    audioPlayer.setVolume(0);
    notifyListeners();
  }

  unMuteAudio() {
    audioPlayer.setVolume(1);
    notifyListeners();
  }

  putToFavourite() {
    notifyListeners();
  }
}
