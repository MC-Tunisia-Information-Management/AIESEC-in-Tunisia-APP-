import 'package:aiesec_core/controllers/tasks_manager_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class TasksManagerScreen extends GetView<TasksManagerController> {
  const TasksManagerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(TasksManagerController());
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: controller.isTLorVP()
          ? FloatingActionButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    scrollable: true,
                    actionsAlignment: MainAxisAlignment.center,
                    title: const Center(child: Text("New task")),
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 12),
                    content: Obx(
                      () => Column(
                        children: controller.taskDialogContent.value,
                      ),
                    ),
                    actions: [
                      GestureDetector(
                        onTap: () => controller.onSendPress(context, 0),
                        child: Text("Send",
                            style: GoogleFonts.poppins(
                                fontSize: 11,
                                fontWeight: FontWeight.w500,
                                color: Get.theme.colorScheme.primary)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: GestureDetector(
                          onTap: () {
                            //controller.reset();
                            Navigator.pop(context);
                          },
                          child: Text(
                            "Cancel",
                            style: GoogleFonts.poppins(
                                fontSize: 11, fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ],
                  ),
                ).then((_) {
                  controller.reset();
                });
              },
              mini: true,
              child: const Icon(Icons.add_rounded, size: 20),
            )
          : null,
      extendBody: false,
      extendBodyBehindAppBar: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Padding(
            padding: const EdgeInsets.only(top: 6.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/no_tasks.svg',
                    height: 90,
                    width: 90,
                  ),
                  Text(
                    'No tasks',
                    style: GoogleFonts.poppins(
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                      color: Get.theme.colorScheme.outline,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
