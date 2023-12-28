import 'package:flutter/material.dart';

import 'package:get/get.dart';

class SearchView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Get.theme.primaryColor,
        body: Center(
            child: Text(
              "Search..",
              style: Get.textTheme.titleLarge,
            )));
  }
}
