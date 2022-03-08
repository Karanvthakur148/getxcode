import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/otpcontroller.dart';

class Page2 extends StatelessWidget {
  static const id = '/page2';

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<Controller>();
    return Scaffold(
      body: Form(key: controller.formKey,
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
                  "Please enter the OTP sent to ${controller.controllerText.value}")),
            ),
            SizedBox(height: 20),

            Padding(
              padding: EdgeInsets.only(left: 35, right: 35),
              child: TextFormField(
                  validator: (value) => controller.otpValidator(value!),
                  controller: controller.otpController,
                  decoration: InputDecoration(hintText: 'Otp')),
            ),
            SizedBox(height: 30),

            Obx(
              () => Text(controller.count.value.toString()),
            ),
            ElevatedButton(
                onPressed: () {
                  controller.count.value++;
                  print("pressed");
                  controller.onSubmit();              },
                child: const Text('Submit')),
          ],
        ),
      ),
    );
  }
}

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:getxcode/controller/otpcontroller.dart';
// import 'package:get/get.dart';
//
//
// class OtpScreen extends StatefulWidget {
//   const OtpScreen({Key? key}) : super(key: key);
//
//   @override
//   _OtpScreenState createState() => _OtpScreenState();
// }
//
// class _OtpScreenState extends State<OtpScreen> {
//   int userNo =9098941214;
//   OtpController controller = OtpController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Form(key: controller.formKey,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const Text(
//               'One Time password',
//               style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 30),
//              Text(
//               'Otp send to this no $userNo',
//               style: TextStyle(fontWeight: FontWeight.bold),
//             ),
//             Padding(
//               padding:  EdgeInsets.only(left: 35, right: 35),
//               child: TextFormField(validator: (value)=> controller.otpValidator(value!),
//                   controller: controller.otpController,
//                   decoration: InputDecoration(hintText: 'Otp')),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(onPressed: () {
//               print("pressed");
//               controller.onSubmit();
//             }, child: const Text('Submit')),
//             SizedBox(height: 30,),
//             Padding(
//               padding:  EdgeInsets.only(left: 35, right: 35),
//               child: TextFormField(validator: (value)=> controller.forgotPasswordValidator(value!),
//                   controller: controller.forgotPasswordController,
//                   decoration: InputDecoration(hintText: 'Forgot Password')),
//             ),
//             SizedBox(height: 20),
//         Obx(() => Text(controller.count.value.toString()),),
//             ElevatedButton(onPressed: () {
//               controller.count.value++ ;
//               print("pressed");
//             }, child: const Text('Submit'))
//           ],
//         ),
//       ),
//     );
//   }
// }
