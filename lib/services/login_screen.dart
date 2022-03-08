import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/otpcontroller.dart';
import 'otp_screen.dart';

class Page1 extends StatelessWidget {
  final controller = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(key:controller.formKey ,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(
                () => (Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text(
                    "Login Counter - ${controller.count.value.toString()}",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                )),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 40, left: 40, top: 50),
                child: TextFormField(
                  controller: controller.textController,
                  validator: (value) => controller.mobileValidator(value!),
                  decoration: InputDecoration(
                    label: Text("Enter Mobile number"),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 40, left: 40, top: 50),
                child: TextFormField(
                  controller: controller.passwordController,
                  validator: (value) => controller.passwordValidator(value!),
                  decoration: InputDecoration(
                    label: Text("Enter Password"),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () {
                  controller.onLogin();
                  controller.count.value++;

                },
                child: Text('LogIn'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
