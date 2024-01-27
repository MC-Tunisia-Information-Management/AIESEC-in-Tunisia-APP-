import 'package:aiesec_core/controllers/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class KPIsController extends GetxController with GetTickerProviderStateMixin {
  final Controller controller = Get.find();
  final hasSelectedDate = false.obs;
  final tag = '[KPISController]';

  DateTime? _startDate;
  final startDate = ''.obs;

  DateTime? _endDate;
  final endDate = ''.obs;

  final isFetching = false.obs;
  final hasErrors = false.obs;
  List itemsList = [];
  late final AnimationController listItemController = AnimationController(
      vsync: this, duration: const Duration(milliseconds: 550));

  Map data = {};

  onStartDatePress() async {
    _startDate = await showDatePicker(
      context: Get.context!,
      initialDate: DateTime.now(),
      firstDate: DateTime(1990),
      lastDate: DateTime.now(),
    );
    if (_startDate != null) {
      startDate.value =
          '${_startDate!.year}-${_startDate!.month.toString().padLeft(2, '0')}-${_startDate!.day.toString().padLeft(2, '0')}';
    }
  }

  onEndDatePress() async {
    _endDate = await showDatePicker(
      context: Get.context!,
      initialDate: DateTime.now(),
      firstDate: DateTime(1990),
      lastDate: DateTime.now(),
    );
    if (_endDate != null) {
      endDate.value =
          '${_endDate!.year}-${_endDate!.month.toString().padLeft(2, '0')}-${_endDate!.day.toString().padLeft(2, '0')}';
    }
  }

  onSearchBtnPress() {
    if (startDate.value.isEmpty) {
      Get.showSnackbar(
        const GetSnackBar(
          duration: Duration(seconds: 3),
          margin: EdgeInsets.all(6.0),
          isDismissible: true,
          snackStyle: SnackStyle.floating,
          messageText: Center(
            child: Text(
              'You need to pick a date range',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      );
    } else if (endDate.value.isEmpty) {
      Get.showSnackbar(
        const GetSnackBar(
          duration: Duration(seconds: 3),
          margin: EdgeInsets.all(6.0),
          isDismissible: true,
          snackStyle: SnackStyle.floating,
          messageText: Center(
            child: Text(
              'You need to pick an end date',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      );
    } else if (_endDate!.isBefore(_startDate!)) {
      Get.showSnackbar(
        const GetSnackBar(
          duration: Duration(seconds: 3),
          margin: EdgeInsets.all(6.0),
          isDismissible: true,
          snackStyle: SnackStyle.floating,
          messageText: Center(
            child: Text(
              'End date can not be before start date',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      );
    } else {
      hasSelectedDate.value = true;
      isFetching.value = true;
    }
  }

  String getValue(status, prefix, suffix) {
    var target = '${prefix}_${status}_$suffix';
    var value = data[target]['applicants']['value'];
    if (suffix == '8') {
      target = target.replaceAll('8', '9');
      value += data[target]['applicants']['value'];
    } else if (suffix == '9') {
      target = target.replaceAll('9', '8');
      value += data[target]['applicants']['value'];
    }
    return '$value';
  }
}
