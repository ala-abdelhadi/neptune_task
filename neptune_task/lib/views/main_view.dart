import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:neptune_task/models/songs.dart';
import 'package:neptune_task/views/broad_cast.dart';
import 'package:neptune_task/views/home_view.dart';
import 'package:neptune_task/views/search_view.dart';
import 'package:neptune_task/views/setting_view.dart';
import 'package:neptune_task/views/song_player_view.dart';

import '../generated/assets.dart';

//mainPAge

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<Widget> tabs = [
    SvgPicture.asset(
      Assets.iconsHomeIcon,
      width: 22,
    ),
    SvgPicture.asset(
      Assets.iconsSearch,
      width: 22,
    ),
    Stack(
      alignment: Alignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(20), //
          decoration: BoxDecoration(
            color: Get.theme.colorScheme.secondary,
            shape: BoxShape.circle,
          ),
        ),
        SvgPicture.asset(
          Assets.iconsHeadset,
          color: Get.theme.cardColor,
          width: 22,
        ),
      ],
    ),
    SvgPicture.asset(
      Assets.iconsFlow,
      width: 22,
    ),
    SvgPicture.asset(
      Assets.iconsSetting,
      width: 22,
    ),
  ];
  int current = 0;

  double changePositionedOfLine() {
    switch (current) {
      case 0:
        return Get.width / 22;
      case 1:
        return Get.width / 4.1;

      case 3:
        return Get.width / 1.49;
      case 4:
        return Get.width / 1.158;
      default:
        return Get.width / 22;
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Get.theme.primaryColor,
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            pages(current),
            progressBar(),
            player(),
            customBottomNavBar(size),
          ],
        ),
      ),
    );
  }

  Container customBottomNavBar(Size size) {
    return Container(
      color: Get.theme.bottomNavigationBarTheme.backgroundColor,
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            height: size.height * 0.06,
            child: ListView.separated(
                separatorBuilder: (context, index) => SizedBox(
                      width: Get.width / 7,
                    ),
                scrollDirection: Axis.horizontal,
                itemCount: tabs.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                      onTap: () {
                        if (index == 2) {
                          //TODO :another instractions
                        } else {
                          setState(() {
                            current = index;
                          });
                        }
                      },
                      child: tabs[index]);
                }),
          ),
          AnimatedPositioned(
            curve: Curves.fastLinearToSlowEaseIn,
            bottom: 5,
            left: changePositionedOfLine(),
            duration: const Duration(milliseconds: 500),
            child: AnimatedContainer(
              width: size.width / 32,
              height: size.height * 0.004,
              decoration: BoxDecoration(
                color: Get.theme.colorScheme.secondary,
                borderRadius: BorderRadius.circular(5),
              ),
              duration: const Duration(milliseconds: 1000),
              curve: Curves.fastLinearToSlowEaseIn,
            ),
          )
        ],
      ),
    );
  }

  GestureDetector player() {
    return GestureDetector(
      onTap: () {
        Get.to(SongPlayerScreen(
            song: Song(
                duration: "04:10",
                title: "Finally Found You",
                label: "enrique igelsias")));
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 57, left: 10, right: 10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              decoration: BoxDecoration(
                color: Get.theme.bottomNavigationBarTheme.backgroundColor!
                    .withOpacity(0.6),
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.all(
                10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Image.asset(
                          Assets.imagesSong,
                          width: 42,
                          height: 42,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        "Finally Found You",
                        style: Get.textTheme.labelMedium,
                      )
                    ],
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(
                        Assets.iconsPause,
                        width: 16,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      SvgPicture.asset(
                        Assets.iconsNext,
                        width: 16,
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Container progressBar() {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(bottom: 45),
      height: 40,
      child: LinearProgressIndicator(
        value:
            0.5, // Set the value between 0.0 and 1.0 to represent the progress
        backgroundColor: Get.theme.primaryColor,
        valueColor: AlwaysStoppedAnimation<Color>(
          Get.theme.colorScheme.secondary,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }

  Widget pages(int current) {
    switch (current) {
      case 0:
        return HomePage();

      case 1:
        return SearchView();

      case 3:
        return BroadCastView();

      case 4:
        return const SettingView();
      default:
        return HomePage();
    }
  }
}
