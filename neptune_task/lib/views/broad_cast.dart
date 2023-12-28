import 'package:flutter/material.dart';

import 'package:get/get.dart';

class BroadCastView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Get.theme.primaryColor,
        body: Center(
            child: Text(
              "PodCasts",
              style: Get.textTheme.titleLarge,
            )));
  }
}
