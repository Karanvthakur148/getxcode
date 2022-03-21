import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxcode/home_page.dart';
import 'package:getxcode/services/login_screen.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() async {
    FirebaseAuth _auth;
    User? _user;

    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) async {
      _auth = FirebaseAuth.instance;
      _user = _auth.currentUser;
      Timer(Duration(seconds: 2),
          () => _user == null ? Get.off(LogInPage()) : Get.off(HomePage()));
    });
    print("call onInit");
    super.onInit();
  }
}
