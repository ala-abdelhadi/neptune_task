import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:neptune_task/controllers/song_player_controller.dart';
import 'package:neptune_task/generated/assets.dart';
import 'package:neptune_task/models/songs.dart';

class SongPlayerScreen extends GetView<SongPlayerController> {
  final Song song;
  const SongPlayerScreen({required this.song});
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => SongPlayerController(song: song));
    return Scaffold(
        body: SingleChildScrollView(
          child: DecoratedBox(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color.fromARGB(255, 22, 26, 26),
                        Color.fromARGB(100, 22, 26, 26),
                      ],
                      tileMode: TileMode.repeated),
                  image: DecorationImage(
                      image: AssetImage(
                        Assets.imagesSongBackground,
                      ),
                      fit: BoxFit.cover)),
              child: Obx(
                    () => SizedBox(
                  height: Get.height,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(24),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Get.close(1);
                              },
                              child: SvgPicture.asset(
                                Assets.iconsArrowBack,
                                width: 8.26,
                              ),
                            ),
                            Text(
                              "NOW PLAYING",
                              style: Get.theme.textTheme.titleMedium,
                            ),
                            SvgPicture.asset(
                              Assets.iconsSearch,
                              width: 15,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: Get.height / 12,
                      ),
                      songImage(),
                      SizedBox(
                        height: Get.height / 23,
                      ),
                      Container(
                          padding: const EdgeInsets.all(24),
                          child: Flex(
                            direction: Axis.horizontal,
                            children: [
                              Expanded(
                                child: OutlinedButton(
                                    style: ButtonStyle(
                                      backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.transparent),
                                    ),
                                    onPressed: () {},
                                    child: Center(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          SvgPicture.asset(
                                            Assets.iconsFavorite,
                                            width: 19.27,
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            "FOLLOW",
                                            style: Get.textTheme.labelSmall,
                                          )
                                        ],
                                      ),
                                    )),
                              ),
                              const SizedBox(
                                width: 12,
                              ),
                              Expanded(
                                child: ElevatedButton(
                                    style: ButtonStyle(
                                      backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Get.theme.colorScheme.secondary),
                                    ),
                                    onPressed: () {},
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset(
                                          Assets.iconsShuffle,
                                          width: 19.27,
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          "SHUFFLE PLAY",
                                          style: Get.textTheme.labelSmall,
                                        )
                                      ],
                                    )),
                              ),
                            ],
                          )),
                      SizedBox(
                        height: Get.height / 14,
                      ),
                      Text(
                        song.title!,
                        style: Get.textTheme.labelLarge,
                      ),
                      SizedBox(
                        height: Get.height / 41,
                      ),
                      Text(
                        song.label!,
                        style: Get.textTheme.bodyLarge,
                      ),
                      SizedBox(
                        height: Get.height / 15,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: ProgressBar(
                          baseBarColor: Get.theme.cardColor.withOpacity(.5),
                          thumbColor: Get.theme.cardColor,
                          progressBarColor: Get.theme.colorScheme.secondary,
                          timeLabelTextStyle: Get.textTheme.bodyLarge,
                          progress: controller.progress.value,
                          buffered: const Duration(milliseconds: 0),
                          total: controller.songDuration,
                          timeLabelLocation: TimeLabelLocation.sides,
                          onSeek: (duration) {
                            controller.progress.value = duration;
                          },
                        ),
                      ),
                      SizedBox(
                        height: Get.height / 20,
                      ),
                      playerWidget(),
                    ],
                  ),
                ),
              )),
        ));
  }

  Container playerWidget() {
    return Container(
        padding: const EdgeInsets.only(right: 76, left: 65),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset(
              Assets.iconsSkipBackward,
              width: 14.45,
            ),
            SvgPicture.asset(
              Assets.iconsRewind,
              width: 25.29,
            ),
            GestureDetector(
              onTap: () {
                controller.songPlaying.value = !controller.songPlaying.value;
                controller.isPaused.value = !controller.isPaused.value;
              },
              child: Container(
                padding:
                const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Get.theme.cardColor),
                alignment: Alignment.centerLeft,
                child: Center(
                  child: SvgPicture.asset(
                    controller.songPlaying.value == false
                        ? Assets.iconsPause
                        : Assets.iconsPlay,
                    color: Get.theme.primaryColor,
                    width: 23.24,
                  ),
                ),
              ),
            ),
            SvgPicture.asset(
              Assets.iconsFastForward,
              width: 25.29,
            ),
            SvgPicture.asset(
              Assets.iconsSkipForward,
              width: 14.45,
            ),
          ],
        ));
  }

  Stack songImage() {
    return Stack(
      alignment: Alignment.center,
      children: [
        SvgPicture.asset(
          Assets.iconsSoundWave,
          width: Get.width,
        ),
        Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(1000),
                  child: Image.asset(
                    Assets.imagesSong,
                    height: 249,
                    width: 249,
                    fit: BoxFit.cover,
                  )),
              Container(
                padding: const EdgeInsets.all(110),
                decoration: BoxDecoration(
                  border: Border.all(color: Get.theme.cardColor),
                  shape: BoxShape.circle,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
