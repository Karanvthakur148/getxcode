import 'package:flutter/material.dart';
import 'package:getxcode/services/login_screen.dart';
import 'package:getxcode/services/otp_screen.dart';
import 'package:getxcode/services/services.dart';

import 'controller/otpcontroller.dart';
import 'home_page.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main()async {
  await GetStorage.init();

  runApp(MyApp());}

  class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
  home: Page1(),
  locale: LocalizationService.locale,
  fallbackLocale: LocalizationService.fallbackLocale,
  translations: LocalizationService(),
  );
  }
  }
