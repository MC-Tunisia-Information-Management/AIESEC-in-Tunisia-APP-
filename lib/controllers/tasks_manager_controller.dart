import 'package:aiesec_core/controllers/controller.dart';
import 'package:aiesec_core/widgets/target_dropdown.dart';
import 'package:aiesec_core/widgets/task_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TasksManagerController extends GetxController {
  final Controller controller = Get.find();

  final RxList<Widget> taskDialogContent = RxList<Widget>([const TaskDialog()]);

  final taskAudience = ''.obs;
  final customSelected = false.obs;
  final customListLoading = true.obs;
  final RxList<Widget> customMembersList = RxList<Widget>([]);
  final Rx<Widget> taskAudienceWidget = Rx<Widget>(TargetDropDown());
  final taskDeadline = ''.obs;
  Map selectedMembers = {};
  final taskTitleError = ''.obs;
  final taskBodyError = ''.obs;
  final taskTitleCtrl = TextEditingController();
  final taskBodyCtrl = TextEditingController();

  bool isTLorVP() {
    return true;
  }

  reset() {
    taskTitleError.value = '';
    taskTitleCtrl.text = '';
    taskBodyError.value = '';
    taskBodyCtrl.text = '';
    taskAudience.value = '';
    taskAudienceWidget.value = TargetDropDown();
    taskDeadline.value = '';
    customSelected.value = false;
    customListLoading.value = true;
    customMembersList.clear();
    selectedMembers.clear();
  }

  onDeadlinePress() async {
    final currentDate = DateTime.now();
    final deadLine = await showDatePicker(
      context: Get.context!,
      initialDate: DateTime.now(),
      firstDate: DateTime(1990),
      lastDate: DateTime(currentDate.year + 1),
    );
    if (deadLine != null) {
      final time = await showTimePicker(
          context: Get.context!, initialTime: TimeOfDay.now());
      if (time != null) {
        taskDeadline.value =
            '${deadLine.year} / ${deadLine.month.toString().padLeft(2, '0')} / ${deadLine.day.toString().padLeft(2, '0')} • ${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}';
      }
    }
  }

  onSendPress(BuildContext context, int type, {String? key}) {}
}
