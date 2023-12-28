import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:neptune_task/controllers/home_controller.dart';
import 'package:neptune_task/generated/assets.dart';
import 'package:neptune_task/models/songs.dart';
import 'package:neptune_task/views/song_player_view.dart';

class HomePage extends GetView<HomePageController> {
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => HomePageController());
    return Scaffold(
        backgroundColor: Get.theme.primaryColor,
        appBar: AppBar(
          backgroundColor: Get.theme.primaryColor,
          title: Text(
            "ALL SONGS",
            style: Get.theme.textTheme.titleLarge,
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: SvgPicture.asset(Assets.iconsSearch),
            ),
          ],
        ),
        body: controller.obx((state) => Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            margin: const EdgeInsets.only(bottom: 50),
            child: ListView.builder(
              itemCount: controller.songsModel.totalCount,
              itemBuilder: (context, index) {
                return songWidget(controller.songsModel.songs![index]);
              },
            ))));
  }

  Widget songWidget(Song song) {
    return Obx(() => GestureDetector(
      onTap: () {
        controller.selectedSong.value = song.id!;
        Get.to(SongPlayerScreen(song: song));
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 19),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
        decoration: BoxDecoration(
            color: controller.selectedSong.value == song.id
                ? Get.theme.cardColor.withOpacity(.1)
                : null,
            borderRadius: const BorderRadius.all(Radius.circular(10))),
        child: Flex(
          direction: Axis.horizontal,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: controller.selectedSong.value == song.id
                      ? Get.theme.colorScheme.secondary
                      : Get.theme.cardColor),
              alignment: Alignment.centerLeft,
              child: Center(
                child: SvgPicture.asset(
                  controller.selectedSong.value == song.id
                      ? Assets.iconsPause
                      : Assets.iconsPlay,
                  width: 8.82,
                ),
              ),
            ),
            const SizedBox(
              width: 17,
            ),
            Expanded(
                flex: 3,
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        song.title!,
                        style: Get.theme.textTheme.titleSmall,
                      ),
                      Text(
                        song.label!,
                        style: Get.theme.textTheme.bodyMedium,
                      ),
                    ],
                  ),
                )),
            Expanded(
              flex: 1,
              child: Container(
                  alignment: Alignment.centerRight,
                  child: Text(
                    song.duration!,
                    style: Get.theme.textTheme.bodyMedium,
                  )),
            )
          ],
        ),
      ),
    ));
  }
}
