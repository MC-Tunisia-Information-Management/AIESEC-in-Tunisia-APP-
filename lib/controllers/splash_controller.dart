import 'package:aiesec_core/screens/home_screen.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onReady() async {
    Future.delayed(const Duration(seconds: 3), () {
      Get.off(() => const HomeScreen());
    });
    super.onReady();
  }
}
