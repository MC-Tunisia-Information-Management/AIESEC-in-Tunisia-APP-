import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/application_controller.dart';

class Application extends StatelessWidget {
  final Map data;
  late final controller =
      Get.put(ApplicationController(data), tag: '${data['id']}');
  Application({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: FractionallySizedBox(
        widthFactor: 0.9,
        child: Obx(() => controller.appWidget.value),
      ),
    );
  }
}
