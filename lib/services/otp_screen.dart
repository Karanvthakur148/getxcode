import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/otpcontroller.dart';
import '../home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/otpcontroller.dart';
import '../home_page.dart';

class OtpScreenPage extends StatelessWidget {
  final controller = Get.put(Controller());
  FirebaseAuth auth = FirebaseAuth.instance;



  static const id = '/page2';
  void signInWithPhoneAuthCredential(
      PhoneAuthCredential phoneAuthCredential,BuildContext context) async {
    try {
      final authCredential =
      await auth.signInWithCredential(phoneAuthCredential);
      if (authCredential.user!=  null) {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){return HomePage();}));
      }
    } on FirebaseAuthException catch (e) {
      print('karan ');
    }
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<Controller>();
    return Scaffold(
      body: Form(key: controller.formKeyOtp,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'One Time password',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 50),
            Center(
              // Obx technically isn't needed for this example because
              // Page2 builds after the value is updated
              child: Obx(() => Text(
                  "Please enter the OTP sent to ${controller.mobileController.value.text}")),
            ),
            SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(validator: (value) => controller.otpValidator(value!),
                controller: controller.otpController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    hintText: 'Enter Valid Password'),
              ),
            ),
            SizedBox(height: 30),

            Obx(
              () => Text(controller.count.value.toString()),
            ),
            TextButton(
                onPressed: () {
                  if(controller.formKeyOtp.currentState!.validate()) {
                    controller.count.value++;
                    verify();
                  }

                },
                child: Text('Submit'))
          ],
        ),
      ),
    );
  }
  Future<void> verify() async {
    PhoneAuthCredential phoneAuthCredential = PhoneAuthProvider.credential(
        verificationId: controller.verificationid,
        smsCode: controller.otpController.text.toString());
    UserCredential user = await auth.signInWithCredential(phoneAuthCredential);
    if (user.user!.uid.isEmpty) {
      print('Otp is wrong');
    } else {
      Get.to(HomePage());
      print('Otp is wrong');

    }
  }

}


