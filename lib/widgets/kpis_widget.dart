import 'package:animated_list_item/animated_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/kpis_controller.dart';

class KPIsWidget extends GetView<KPIsController> {
  const KPIsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(KPIsController());
    return Material(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 12.0, horizontal: 20.0),
                child: Text(
                  'Analytics',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    color: Get.theme.colorScheme.onSurface,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: Get.height > 650 ? 8.0 : 0.0,
                  bottom: Get.height > 650 ? 12.0 : 6.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () => controller.onStartDatePress(),
                    child: Container(
                      padding: const EdgeInsets.all(12.0),
                      decoration: BoxDecoration(
                        color: Get.theme.colorScheme.primary,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          Obx(
                            () => Text(
                              controller.startDate.isEmpty
                                  ? "Start date"
                                  : controller.startDate.value,
                              style: TextStyle(
                                  color: Get.theme.colorScheme.onPrimary,
                                  fontWeight: FontWeight.w600,
                                  fontSize: Get.height > 650 ? 12 : 11),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Icon(Icons.date_range,
                                color: Get.theme.colorScheme.onPrimary,
                                size: Get.height > 650 ? 17 : 16),
                          )
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: controller.onEndDatePress,
                    child: Container(
                      padding: const EdgeInsets.all(12.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Get.theme.colorScheme.primary,
                      ),
                      child: Row(
                        children: [
                          Obx(
                            () => Text(
                              controller.endDate.isEmpty
                                  ? "End date"
                                  : controller.endDate.value,
                              style: TextStyle(
                                  color: Get.theme.colorScheme.onPrimary,
                                  fontWeight: FontWeight.w600,
                                  fontSize: Get.height > 650 ? 12 : 11),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Icon(Icons.date_range,
                                color: Get.theme.colorScheme.onPrimary,
                                size: Get.height > 650 ? 17 : 16),
                          )
                        ],
                      ),
                    ),
                  ),
                  IconButton(
                    padding: EdgeInsets.zero,
                    splashRadius: 0.1,
                    onPressed: controller.onSearchBtnPress,
                    icon: Icon(
                      Icons.search,
                      size: 26,
                      color: Get.theme.colorScheme.onSurfaceVariant,
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: SizedBox(
                child: Obx(
                  () => controller.hasSelectedDate.value
                      ? controller.isFetching.value
                          ? const Center(
                              child: SizedBox(
                                height: 20,
                                width: 20,
                                child:
                                    CircularProgressIndicator(strokeWidth: 1.0),
                              ),
                            )
                          : controller.hasErrors.value
                              ? Center(
                                  child: Text(
                                    "Something went wrong",
                                    style: GoogleFonts.poppins(
                                        color: Get.theme.colorScheme.error,
                                        fontSize: Get.height > 650 ? 12 : 8),
                                  ),
                                )
                              : Center(
                                  child: ListView.builder(
                                    physics: const BouncingScrollPhysics(),
                                    itemCount: controller.itemsList.length,
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) {
                                      return AnimatedListItem(
                                        index: index,
                                        length: controller.itemsList.length,
                                        aniController:
                                            controller.listItemController,
                                        animationType: AnimationType.slide,
                                        child: controller.itemsList[index],
                                        startY: -120,
                                      );
                                    },
                                  ),
                                )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'assets/search.svg',
                              height: 60,
                              width: 60,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: Get.height > 650 ? 16.0 : 8),
                              child: Text(
                                "Select a date range",
                                style: GoogleFonts.poppins(
                                    color: const Color.fromARGB(
                                        255, 116, 124, 129),
                                    fontSize: 11),
                              ),
                            )
                          ],
                        ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
