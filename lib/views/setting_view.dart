import 'package:flutter/material.dart';
import 'package:get/get.dart';

//in  example you can use StatelessWidget insted of the GetView
class SettingView extends StatelessWidget {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Get.theme.primaryColor,
        body: Center(
            child: Text(
              "Settings",
              style: Get.textTheme.titleLarge,
            )));
  }
}
