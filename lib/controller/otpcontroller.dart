import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../home_page.dart';
import '../services/otp_screen.dart';

class Controller extends GetxController {
  var count = 0.obs;
  final formKey = GlobalKey<FormState>();
  TextEditingController otpController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  onLogin() {
    if (formKey.currentState!.validate()) {
      Get.to(Page2());

      Get.snackbar(
        "validate ",
        "success fully log In",
        colorText: Colors.black,
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(microseconds: 700),
      );
    }
  }


  String? mobileValidator(String value) {
    if (value.isEmpty || value.length != 10) {
      return "Please enter valid number";
    } else {
      return null;
    }
  }

  final textController = TextEditingController();

  String? otpValidator(String value) {
    if (value.isEmpty || value.length != 6) {
      return 'Please Enter Otp';
    }
    {
      return null;
    }
  }

  String? passwordValidator(String value) {
    if (value.isEmpty || value.length != 8) {
      return "Please enter valid password";
    } else {
      return null;
    }
  }

  void onSubmit() {
    if (formKey.currentState!.validate()) {
      Get.to(HomePage());
    }
  }

  RxString controllerText = ''.obs;

  @override
  void onInit() {
    super.onInit();
    textController.addListener(() {
      controllerText.value = textController.text;
    });
  }
}

// import 'package:flutter/cupertino.dart';
// import 'package:get/get.dart';
//
// import '../home_page.dart';
// class OtpController extends GetxController{
//   var count = 0.obs;
//
//
//   final formKey = GlobalKey<FormState>();
//   TextEditingController otpController = TextEditingController();
//   TextEditingController forgotPasswordController = TextEditingController();
//
//   String? otpValidator(String value) {
//     if (value.isEmpty || value.length != 6) {
//       return 'Please Enter Otp';
//     }{
//       return null;
//
//     }
//   }
//   String? forgotPasswordValidator(String value) {
//     if (value.isEmpty || value.length !=10) {
//       return 'Please Enter Otp';
//     }{
//       return null;
//
//     }
//   }
//  void onSubmit(){
//     if(formKey.currentState!.validate()){
//       Get.to(HomePage());
//     }
//   }
//
//
// }
