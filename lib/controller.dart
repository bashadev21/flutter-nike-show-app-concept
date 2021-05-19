import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyController extends GetxController {
  var indexis = 1.obs;
  var selectedPageIndex = 0.obs;
  var sizeselect = false.obs;
  var selecteditem = 10.obs;
  // bool get isLastPage =>
  //     selectedPageIndex.value == shoselist[0].image.length - 1;
  var pageController = PageController();
  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }

  setindex(int index) {
    indexis(index);
  }
}
