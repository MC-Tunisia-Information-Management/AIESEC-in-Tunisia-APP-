import 'package:aiesec_core/controllers/tasks_manager_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class TargetDropDown extends GetView<TasksManagerController> {
  TargetDropDown({super.key});
  final TextStyle itemFont = GoogleFonts.poppins(fontSize: 8);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: Obx(
        () => DropdownButton(
          iconSize: 18,
          items: [
            DropdownMenuItem(
              value: 'Everyone',
              child: Text("Everyone", style: itemFont),
            ),
            DropdownMenuItem(
              value: 'Team leaders',
              child: Text("Team leaders", style: itemFont),
            ),
            DropdownMenuItem(
              value: 'Members',
              child: Text("Members", style: itemFont),
            ),
          ],
          onChanged: (value) {
            if (value != null) {
              controller.taskAudience.value = value;
            }
          },
          isDense: true,
          value: controller.taskAudience.value.isEmpty
              ? null
              : controller.taskAudience.value,
        ),
      ),
    );
  }
}
