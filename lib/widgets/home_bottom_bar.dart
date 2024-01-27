import 'package:aiesec_core/controllers/controller.dart';
import 'package:aiesec_core/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeBottomBar extends StatelessWidget {
  HomeBottomBar({super.key});

  final selectedIndex = 0.obs;

  @override
  Widget build(BuildContext context) {
    final Controller controller = Get.find();
    return BottomAppBar(
      elevation: 0,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Obx(
            () => BottomBarItem(
              icon: Icons.home_filled,
              isSelected: selectedIndex.value == 0,
              onTap: () {
                if (selectedIndex.value != 0) {
                  controller.navigatedFromBottomBar = true;
                  selectedIndex.value = 0;
                  controller.mainController
                      .animateToPage(0,
                          duration: const Duration(milliseconds: 200),
                          curve: Curves.easeIn)
                      .then(
                          (value) => controller.navigatedFromBottomBar = false);
                }
              },
            ),
          ),
          Obx(
            () => BottomBarItem(
              icon: Icons.analytics_outlined,
              isSelected: selectedIndex.value == 1,
              onTap: () {
                if (selectedIndex.value != 1) {
                  controller.navigatedFromBottomBar = true;
                  selectedIndex.value = 1;
                  controller.mainController
                      .animateToPage(1,
                          duration: const Duration(milliseconds: 200),
                          curve: Curves.easeIn)
                      .then(
                          (value) => controller.navigatedFromBottomBar = false);
                }
              },
            ),
          ),
          Obx(
            () => BottomBarItem(
              icon: Icons.edit_note_rounded,
              isSelected: selectedIndex.value == 2,
              onTap: () {
                if (selectedIndex.value != 2) {
                  controller.navigatedFromBottomBar = true;
                  selectedIndex.value = 2;
                  controller.mainController
                      .animateToPage(2,
                          duration: const Duration(milliseconds: 200),
                          curve: Curves.easeIn)
                      .then(
                          (value) => controller.navigatedFromBottomBar = false);
                }
              },
            ),
          ),
          BottomBarItem(
            icon: Icons.logout_rounded,
            isSelected: false,
            onTap: () async {
              await Get.dialog(
                AlertDialog(
                  content: Text('Do you really wish to log out ?',
                      style: GoogleFonts.poppins(),
                      textAlign: TextAlign.center),
                  actionsAlignment: MainAxisAlignment.center,
                  contentPadding: const EdgeInsets.only(
                      left: 30.0, right: 30.0, top: 20.0, bottom: 8),
                  actionsPadding: EdgeInsets.zero,
                  actions: [
                    TextButton(
                        onPressed: () async {
                          Get.off(() => const SplashScreen());
                        },
                        child: Text('Confirm',
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                color: Get.theme.colorScheme.primary))),
                    TextButton(
                        onPressed: () => Get.back(),
                        child: Text('Cancel',
                            style: GoogleFonts.poppins(
                                color: Get.theme.colorScheme.outline)))
                  ],
                ),
              );
              //Get.log('[BottomNavBar] LogOut ? $response');
            },
          )
        ],
      ),
    );
  }
}

class BottomBarItem extends StatelessWidget {
  final IconData icon;
  final bool isSelected;
  final Function() onTap;
  const BottomBarItem(
      {super.key,
      required this.icon,
      required this.isSelected,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: isSelected
          ? Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: onTap,
                  child: Icon(
                    icon,
                    color: Get.theme.colorScheme.outline,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Container(
                    height: 4,
                    width: 4,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Get.theme.colorScheme.tertiary,
                    ),
                  ),
                )
              ],
            )
          : GestureDetector(
              onTap: onTap,
              child: Icon(
                icon,
                color: Get.theme.colorScheme.outlineVariant,
              ),
            ),
    );
  }
}
