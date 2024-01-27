import 'package:aiesec_core/controllers/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends GetView<ProfileController> {
  final Map epData;
  final String name;
  const ProfileScreen({super.key, required this.epData, required this.name});

  generateEpInfo() {
    List<Widget> rowChildren = [
      Container(
        padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 15),
        decoration: BoxDecoration(
          color: Get.theme.colorScheme.surfaceVariant,
          borderRadius: BorderRadius.circular(
            20,
          ),
        ),
        child: Text(
          'Open',
          style: GoogleFonts.poppins(
              color: Get.theme.colorScheme.onSurfaceVariant,
              fontSize: Get.width > 360 ? null : 10),
        ),
      )
    ];
    rowChildren.add(
      Container(
        padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 15),
        decoration: BoxDecoration(
          color: Get.theme.colorScheme.surfaceVariant,
          borderRadius: BorderRadius.circular(
            20,
          ),
        ),
        child: Text(
          '+216 XX XXX XXX',
          style: GoogleFonts.poppins(
              color: Get.theme.colorScheme.onSurfaceVariant,
              fontSize: Get.width > 360 ? null : 10),
        ),
      ),
    );
    return rowChildren;
  }

  @override
  Widget build(BuildContext context) {
    Get.put(ProfileController('EP_ID', 'EP_NAME'));
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
          statusBarColor: Get.theme.colorScheme.secondary,
          statusBarIconBrightness: Brightness.light),
      child: Scaffold(
        backgroundColor: Get.theme.colorScheme.surface,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: Get.height * 0.35,
              child: Stack(
                children: [
                  FractionallySizedBox(
                    heightFactor: 0.85,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Get.theme.colorScheme.secondary,
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0.0,
                    left: Get.width > 350
                        ? Get.width * 0.5 - 44.0
                        : Get.width * 0.5 - 32.5,
                    child: Container(
                      height: Get.width > 350 ? 90 : 65,
                      width: Get.width > 350 ? 90 : 65,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                            color: Get.theme.colorScheme.onSecondary,
                            width: 3.0),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(40),
                        child: SvgPicture.network(
                          'https://cdn-expa.aiesec.org/gis-img/missing_profile_${name[0].toLowerCase()}.svg',
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: SizedBox(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text(
                        "[EP_NAME]",
                        style: GoogleFonts.poppins(
                          color: Get.theme.colorScheme.onSurfaceVariant,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: generateEpInfo(),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0, bottom: 6.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Divider(
                              color: Get.theme.colorScheme.outline,
                              endIndent: 15,
                              indent: Get.width * 0.06,
                            ),
                          ),
                          Text(
                            "Applications",
                            style: GoogleFonts.poppins(
                                color: Get.theme.colorScheme.outline,
                                fontSize: 10),
                          ),
                          Expanded(
                            child: Divider(
                              color: Get.theme.colorScheme.outline,
                              indent: 15,
                              endIndent: Get.width * 0.06,
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          child: Obx(
                            () => Padding(
                              padding: const EdgeInsets.only(bottom: 12.0),
                              child: Column(
                                children: controller.applications.value,
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
