import 'package:aiesec_core/controllers/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/application.dart';

class ProfileController extends GetxController {
  final String epID;
  final String epName;
  final Controller controller = Get.find();

  final tag = '[ProfileController]';

  ProfileController(this.epID, this.epName);
  final Rx<List<Widget>> applications = Rx<List<Widget>>([
    const SizedBox(
      height: 20,
      width: 20,
      child: CircularProgressIndicator(strokeWidth: 1.0),
    )
  ]);
  final isThereOneAppError = false.obs;

  generateOpportunities() {
    applications.value = [];
    for (int i = 0; i < 2; i++) {
      applications.value.add(Application(data: {'id': i}));
    }
  }

  @override
  void onInit() {
    generateOpportunities();
    super.onInit();
  }
}
