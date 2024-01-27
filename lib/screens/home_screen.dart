import 'package:aiesec_core/screens/tasks_manager_screen.dart';
import 'package:aiesec_core/widgets/custom_card.dart';
import 'package:aiesec_core/widgets/kpis_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../controllers/controller.dart';
import '../widgets/ep_widget.dart';

class HomeScreen extends GetView<Controller> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
          statusBarColor: Color.fromARGB(255, 61, 63, 69),
          systemNavigationBarColor: Colors.white,
          systemNavigationBarIconBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.light),
      child: SafeArea(
        child: Scaffold(
          extendBody: false,
          bottomNavigationBar: controller.bottomBar,
          body: PageView(
            physics: const AlwaysScrollableScrollPhysics(),
            onPageChanged: (value) {
              if (!controller.navigatedFromBottomBar) {
                controller.bottomBar.selectedIndex.value = value;
              }
            },
            controller: controller.mainController,
            scrollDirection: Axis.horizontal,
            children: const [MainPage(), KPIsWidget(), TasksManagerScreen()],
          ),
        ),
      ),
    );
  }
}

class MainPage extends GetView<Controller> {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Flexible(
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: 24.0,
                        top: Get.height > 650 ? 35 : 20,
                        bottom: Get.height > 650 ? 0 : 8),
                    child: Text(
                      "Welcome, AIESECer !",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 22,
                      ),
                    ),
                  ),
                ),
                Flexible(
                  child: SizedBox(
                    child: Center(
                      child: FractionallySizedBox(
                        heightFactor: Get.height > 650 ? 0.75 : 1.0,
                        widthFactor: 0.85,
                        child: PageView(
                          controller: controller.pageController,
                          physics: const BouncingScrollPhysics(),
                          children: const [
                            CustomCard(id: 0, title: 'Applied'),
                            CustomCard(id: 1, title: 'Accepted'),
                            CustomCard(id: 2, title: 'Approved'),
                            CustomCard(id: 3, title: 'Realized'),
                            CustomCard(id: 4, title: 'Finished'),
                            CustomCard(id: 5, title: 'Completed'),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      bottom: Get.height > 650 ? 35.0 : 25,
                      top: Get.height > 650 ? 0 : 10),
                  child: Center(
                    child: SmoothPageIndicator(
                      effect: const ScrollingDotsEffect(
                          dotColor: Color(0xFFbac1d4),
                          activeDotColor: Color.fromARGB(255, 19, 135, 244),
                          dotHeight: 6,
                          dotWidth: 6),
                      controller: controller.pageController,
                      count: 6,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    decoration: const BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black12,
                            offset: Offset(0.0, -1.0),
                            blurRadius: 12,
                            spreadRadius: 20)
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 12.0),
                        child: Column(
                          children: List.generate(
                            3,
                            (index) => EPWidget(
                                name: controller.epss[index],
                                id: (index + 1) * 15987,
                                data: const {}).fadeIn(
                              duration: const Duration(milliseconds: 400),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
