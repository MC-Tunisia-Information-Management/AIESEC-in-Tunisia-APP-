import 'package:aiesec_core/controllers/tasks_manager_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class TaskDialog extends GetView<TasksManagerController> {
  const TaskDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Obx(
            () => TextFormField(
              controller: controller.taskTitleCtrl,
              autocorrect: false,
              enableSuggestions: false,
              enableIMEPersonalizedLearning: false,
              onChanged: (value) {
                if (value.isNotEmpty) {
                  controller.taskTitleError.value = '';
                }
              },
              style: GoogleFonts.poppins(
                fontSize: 11,
                decoration: TextDecoration.none,
              ),
              textAlign: TextAlign.justify,
              decoration: InputDecoration(
                errorText: controller.taskTitleError.isEmpty
                    ? null
                    : controller.taskTitleError.value,
                errorStyle: GoogleFonts.poppins(
                    color: Get.theme.colorScheme.error, fontSize: 8),
                floatingLabelStyle: GoogleFonts.poppins(
                    fontSize: 12,
                    decoration: TextDecoration.none,
                    fontWeight: FontWeight.w500),
                alignLabelWithHint: true,
                isDense: true,
                contentPadding: const EdgeInsets.all(12.0),
                labelText: 'Title',
                hintText: 'Enter a title for your task',
                hintStyle: GoogleFonts.poppins(
                  fontSize: 11,
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        width: 1.5, color: Get.theme.colorScheme.primary)),
                border: const OutlineInputBorder(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: TextFormField(
              controller: controller.taskBodyCtrl,
              autocorrect: false,
              enableSuggestions: false,
              enableIMEPersonalizedLearning: false,
              onChanged: (value) {
                if (value.isNotEmpty) {
                  controller.taskBodyError.value = '';
                }
              },
              style: GoogleFonts.poppins(
                fontSize: 11,
                decoration: TextDecoration.none,
              ),
              textAlign: TextAlign.justify,
              minLines: 2,
              maxLines: 4,
              decoration: InputDecoration(
                errorText: controller.taskBodyError.isEmpty
                    ? null
                    : controller.taskBodyError.value,
                errorStyle: GoogleFonts.poppins(
                    color: Get.theme.colorScheme.error, fontSize: 8),
                floatingLabelStyle: GoogleFonts.poppins(
                    fontSize: 12,
                    decoration: TextDecoration.none,
                    fontWeight: FontWeight.w500),
                alignLabelWithHint: true,
                isDense: true,
                contentPadding: const EdgeInsets.all(12.0),
                labelText: 'Body',
                hintText: 'Enter more details about the task',
                hintStyle: GoogleFonts.poppins(
                  fontSize: 11,
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        width: 1.5, color: Get.theme.colorScheme.primary)),
                border: const OutlineInputBorder(),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Text(
                      "To",
                      style: GoogleFonts.poppins(fontSize: 11),
                    ),
                  ),
                  Obx(() => controller.taskAudienceWidget.value)
                ],
              ),
              GestureDetector(
                onTap: controller.onDeadlinePress,
                child: Container(
                  padding: EdgeInsets.all(Get.height > 650 ? 10.0 : 8.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: Get.theme.colorScheme.outlineVariant,
                    ),
                  ),
                  child: Row(
                    children: [
                      Obx(
                        () => Text(
                          controller.taskDeadline.isEmpty
                              ? "Deadline"
                              : controller.taskDeadline.value,
                          style: TextStyle(
                              color: Get.theme.colorScheme.outline,
                              fontSize: Get.height > 650 ? 12 : 10),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Icon(Icons.date_range,
                            color: Get.theme.colorScheme.outline,
                            size: Get.height > 650 ? 17 : 16),
                      )
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
