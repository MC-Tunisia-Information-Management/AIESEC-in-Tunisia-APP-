import 'package:aiesec_core/utils/user.dart';

import 'package:aiesec_core/widgets/home_bottom_bar.dart';

import 'package:flutter/material.dart'
    show Center, PageController, SizedBox, Widget;
import 'package:get/get.dart';

class Controller extends GetxController {
  final accessToken = ''.obs;
  final List<String> epss = [
    'Mohammed Ben Omor',
    'Salima Siala',
    'Achraf Aloulou'
  ];
  final Rx<User> user = Rx<User>(User());
  bool navigatedFromBottomBar = false;
  final PageController mainController = PageController(initialPage: 0);
  final PageController pageController = PageController();
  final Rx<Widget> homePeopleIManage =
      Rx<Widget>(const Center(child: SizedBox()));
  final HomeBottomBar bottomBar = HomeBottomBar();
  final tag = '[Controller]';
  final List<String> appStatus = [
    'matched',
    'approved',
    'realized',
    'finished',
    'completed'
  ];
}
