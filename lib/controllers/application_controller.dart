import 'dart:math';

import 'package:another_stepper/another_stepper.dart';
import 'package:card_loading/card_loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import 'controller.dart';

class ApplicationController extends GetxController
    with GetTickerProviderStateMixin {
  final Map data;
  ApplicationController(this.data);
  late final arrowRotation = AnimationController(
      duration: const Duration(milliseconds: 120), vsync: this);

  final Controller controller = Get.find();
  final Random rand = Random();
  final tag = '[ApplicationController]';

  final Rx<Widget> appWidget = Rx<Widget>(
    CardLoading(
      height: 50,
      borderRadius: BorderRadius.circular(8),
    ),
  );

  Future<void> openOpportunity() async {
    if (data['status'] != 'un_publish' && data['status'] != 'under_review') {
      String url = 'https://aiesec.org/opportunity/global-talent/${data['id']}';
      await launchUrl(Uri.parse(url));
    }
  }

  fetchData() {
    appWidget.value = Obx(
      () => AnimatedCrossFade(
        duration: const Duration(milliseconds: 120),
        crossFadeState: isArrowPressed.value
            ? CrossFadeState.showSecond
            : CrossFadeState.showFirst,
        firstChild: Container(
          padding: const EdgeInsets.all(12.0),
          decoration: BoxDecoration(
            color: Get.theme.colorScheme.surface,
            border: Border.all(color: Get.theme.colorScheme.outlineVariant),
            borderRadius: BorderRadius.circular(8),
          ),
          child: GestureDetector(
            onTap: openOpportunity,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(children: [
                  Expanded(
                    child: SizedBox(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            '[OPPORTUNITY_TITLE]',
                            style: GoogleFonts.poppins(
                              color: Get.theme.colorScheme.onSurface,
                              fontSize: Get.width > 360 ? 13 : 11,
                              fontWeight: FontWeight.w500,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text('[ORGANISATION]',
                              style: GoogleFonts.poppins(
                                color: Get.theme.colorScheme.onSurfaceVariant,
                                fontSize: Get.width > 360 ? 9 : 8,
                              ),
                              overflow: TextOverflow.ellipsis)
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      isArrowPressed.toggle();
                    },
                    child: RotationTransition(
                      turns: Tween(begin: 0.0, end: 0.5).animate(arrowRotation),
                      child: Icon(Icons.keyboard_arrow_down_rounded,
                          color: Get.theme.colorScheme.onSurfaceVariant,
                          size: Get.height > 650 ? 18 : 16),
                    ),
                  ),
                ]),
              ],
            ),
          ),
        ),
        secondChild: Container(
          padding: const EdgeInsets.all(12.0),
          decoration: BoxDecoration(
            color: Get.theme.colorScheme.surface,
            border: Border.all(color: Get.theme.colorScheme.outlineVariant),
            borderRadius: BorderRadius.circular(8),
          ),
          child: GestureDetector(
            onTap: openOpportunity,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(children: [
                  Expanded(
                    child: SizedBox(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('[OPPORTUNITY_TITLE]',
                              style: GoogleFonts.poppins(
                                color: Get.theme.colorScheme.onSurface,
                                fontSize: Get.width > 360 ? 13 : 11,
                                fontWeight: FontWeight.w500,
                              ),
                              overflow: TextOverflow.ellipsis),
                          Text('[ORGANISATION]',
                              style: GoogleFonts.poppins(
                                color: Get.theme.colorScheme.onSurfaceVariant,
                                fontSize: Get.width > 360 ? 9 : 8,
                              ),
                              overflow: TextOverflow.ellipsis)
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      isArrowPressed.toggle();
                    },
                    child: RotationTransition(
                      turns: Tween(begin: 0.0, end: 0.5).animate(arrowRotation),
                      child: Icon(Icons.keyboard_arrow_down_rounded,
                          color: Get.theme.colorScheme.onSurfaceVariant,
                          size: Get.height > 650 ? 18 : 16),
                    ),
                  ),
                ]),
                Column(
                    children: generateContent({
                  'status': rand.nextBool() ? 'realized' : 'approved',
                  'created_at': 'yyyy-mm-dd',
                  'matched': 'yyyy-mm-dd',
                  'approved': 'yyyy-mm-dd',
                  'realized': 'yyyy-mm-dd'
                }))
              ],
            ),
          ),
        ),
      ),
    );
  }

  late final isArrowPressed = false.obs
    ..listen((p0) {
      if (p0) {
        arrowRotation.forward();
      } else {
        arrowRotation.reverse();
      }
    });

  List<Widget> generateContent(Map appData) {
    List<Widget> content = [const Divider()];
    String status = appData['status'];
    String createdDate = appData['created_at'];
    String statusDate = appData[status];
    if (status != 'rejected' && status != 'withdrawn') {
      final index = controller.appStatus.indexOf(status);
      int currentIndex = 0;
      final List<StepperData> steps = [];
      for (String appStatus in controller.appStatus) {
        steps.add(
          StepperData(
            title: StepperText(appStatus.capitalizeFirst,
                textStyle: GoogleFonts.poppins(fontSize: 6)),
            subtitle: currentIndex <= index
                ? StepperText(
                    appData[appStatus],
                    textStyle: GoogleFonts.poppins(fontSize: 6),
                  )
                : null,
          ),
        );
        currentIndex++;
      }
      content.add(Padding(
        padding: const EdgeInsets.only(bottom: 16.0),
        child: Text(
          'Applied : $createdDate',
          style: GoogleFonts.poppins(fontSize: 9),
          textAlign: TextAlign.center,
        ),
      ));
      content.add(
        AnotherStepper(
          iconHeight: 10,
          iconWidth: 10,
          stepperList: steps,
          stepperDirection: Axis.horizontal,
          activeIndex: index,
        ),
      );
    } else {
      content.add(
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 3.0),
              child: Text(
                'Applied : $createdDate',
                style: GoogleFonts.poppins(fontSize: 9),
                textAlign: TextAlign.center,
              ),
            ),
            Text(
              '${status.capitalizeFirst} : $statusDate',
              style: GoogleFonts.poppins(fontSize: 9),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
    }
    return content;
  }

  @override
  void onInit() {
    fetchData();
    super.onInit();
  }
}
