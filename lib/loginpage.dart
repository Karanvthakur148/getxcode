import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxcode/ragister.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body: Column(
        children: [
          GestureDetector(onTap: (){
            Get.to(const RagisterPage());
          },
              child: Center(child: Text('Login'))),
       FlatButton(onPressed: (){
         //Get.defaultDialog(title: 'Meand you');
         Get.snackbar('Flat', "you are crazy");
       }, child: const Text('Flatebutoon')) ],
      ),
    );
  }
}
