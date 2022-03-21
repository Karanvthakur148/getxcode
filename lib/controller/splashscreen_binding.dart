import 'package:get/get.dart';
import 'package:getxcode/controller/splashscreen_controller.dart';

class SplashBinding implements Bindings {
  void dependencies() {
    Get.put<SplashScreenController>(SplashScreenController());
  }
}
