import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxcode/services/otp_screen.dart';

import '../controller/otpcontroller.dart';

class Page1 extends StatelessWidget {
  final controller = Get.put(Controller());
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: controller.formKeyLogin,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(
                       "Login",
                       style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
          SizedBox(height: 50,),
          Padding(
            padding: const EdgeInsets.only(left: 35,right: 35,),
            child: TextFormField(
              validator: (value) => controller.mobileValidator(value!),
              controller: controller.mobileController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Phone Number',
                  hintText: 'Enter Valid Number'),
            ),
          ),
          SizedBox(height: 20),
          TextButton(
              onPressed: () {
                if(controller.formKeyLogin.currentState!.validate()) {
                  fetchOtp();
                }
              },
              child: Text('Fetch OTP')),
        ]),
      ),
      // body: Center(
      //   child: Form(key:controller.formKeyLogin ,
      //     child: Column(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       children: [
      //         Obx(
      //           () => (Padding(
      //             padding: EdgeInsets.all(12.0),
      //             child: Text(
      //               "Login Counter - ${controller.count.value.toString()}",
      //               style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
      //             ),
      //           )),
      //         ),
      //         Padding(
      //           padding: const EdgeInsets.only(right: 40, left: 40, top: 50),
      //           child: TextFormField(
      //             controller: controller.textController,
      //             validator: (value) => controller.mobileValidator(value!),
      //             decoration: InputDecoration(
      //               label: Text("Enter Mobile number"),
      //               border: OutlineInputBorder(
      //                 borderRadius: BorderRadius.circular(12),
      //               ),
      //             ),
      //           ),
      //         ),
      //         Padding(
      //           padding: const EdgeInsets.only(right: 40, left: 40, top: 50),
      //           child: TextFormField(
      //             controller: controller.passwordController,
      //             validator: (value) => controller.passwordValidator(value!),
      //             decoration: InputDecoration(
      //               label: Text("Enter Password"),
      //               border: OutlineInputBorder(
      //                 borderRadius: BorderRadius.circular(12),
      //               ),
      //             ),
      //           ),
      //         ),
      //         SizedBox(
      //           height: 30,
      //         ),
      //         ElevatedButton(
      //           onPressed: () {
      //             controller.onLogin();
      //             controller.count.value++;
      //
      //           },
      //           child: Text('LogIn'),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }

  Future<void> fetchOtp() async {
    await auth.verifyPhoneNumber(
        phoneNumber: controller.mobileController.text.toString(),
        verificationCompleted: (PhoneAuthCredential credential) async {
          await auth.signInWithCredential(credential);
        },
        verificationFailed: (FirebaseAuthException e) {
          if (e.code == "invalid-phone-number") {
            print('Invalid phone number');
          }
        },
        codeSent: (String verificationid, int? resendToken) async {
          controller.verificationid = verificationid;
          Get.to(OtpScreenPage());
        },
        codeAutoRetrievalTimeout: (String verificationid) {});
  }
}
