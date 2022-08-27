import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/home_page_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<HomePageController>(
        init: HomePageController(),
        builder: (controller) {
          return Container();
        },
      ),
    );
  }
}
