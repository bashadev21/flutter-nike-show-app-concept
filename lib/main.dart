import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nike_shoes_app/controller.dart';

import 'bottom_bar.dart';

void main() {
  Get.put(MyController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: BottamBar(
        currentindex: 1,
      ),
    );
  }
}
