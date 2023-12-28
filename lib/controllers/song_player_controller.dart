import 'dart:async';

import 'package:get/get.dart';
import 'package:neptune_task/models/songs.dart';

class SongPlayerController extends GetxController with StateMixin {
  final Song song;
  SongPlayerController({required this.song});
  RxBool songPlaying = false.obs;
  late Duration songDuration;
  late Rx<Duration> progress;
  RxBool isPaused = false.obs;

  @override
  void onInit() {
    super.onInit();
    timeConverter();
  }

  void timeConverter() {
    List<String> timeParts = song.duration!.split(':');
    int minutes = int.parse(timeParts[0]);
    int seconds = int.parse(timeParts[1]);
    songDuration = Duration(minutes: minutes, seconds: seconds);

    //FIXME : this must start from zero but it just for showing the progress bar faster
    progress =
        Duration(minutes: (minutes / 2).floor(), seconds: (seconds / 2).ceil())
            .obs;
    startSong();
  }

  void startSong() {
    Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      if (!isPaused.value) {
        if (progress.value != songDuration) {
          progress.value += const Duration(seconds: 1);
        } else {
          // Timer completed, do something here if needed
          timer.cancel();
        }
      }
    });
  }
}
