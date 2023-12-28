import 'dart:convert';

import 'package:get/get.dart';
import 'package:neptune_task/data/songs_json.dart';
import 'package:neptune_task/models/songs.dart';

class HomePageController extends GetxController with StateMixin {
  SongsModel songsModel = SongsModel();
  late RxInt selectedSong;

  @override
  void onInit() {
    getDataFromServer();
    super.onInit();
  }

  //when the data is coming form real server this should be future
  void getDataFromServer() {
    var data = json.decode(dataFromServer);
    if (data != null) {
      songsModel = SongsModel.fromJson(data);
      selectedSong = songsModel.songs![0].id!.obs;
      change(selectedSong, status: RxStatus.success());
    }
  }
}
