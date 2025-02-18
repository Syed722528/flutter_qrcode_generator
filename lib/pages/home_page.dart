import 'package:flutter/material.dart';
import 'package:flutter_qrcode_generator/pages/generator.dart';
import 'package:flutter_qrcode_generator/pages/scanner.dart';
import 'package:get/get.dart';

import '../widgets/custom_container_decoration.dart';
import '../widgets/custom_elevated_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Flutter Qr code'),
        centerTitle: true,
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: Get.height * 0.40,
                width: Get.width * 0.90,

                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                decoration: customContainerDecoration(),
                child: Column(
                  spacing: 3,
                  children: [
                    Expanded(child: Image.asset('assets/generator.jpg')),
                    ElevatedButton(
                      style: customElevatedButtonStyle(),
                      onPressed: () {
                        Get.to(Generator());
                      },
                      child: Text('Generate Qr code'),
                    ),
                  ],
                ),
              ),
              Container(
                height: Get.height * 0.40,
                width: Get.width * 0.90,
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                decoration: customContainerDecoration(),
                child: Column(
                  spacing: 15,
                  children: [
                    Expanded(child: Image.asset('assets/scanner.png')),
                    ElevatedButton(
                      style: customElevatedButtonStyle(),
                      onPressed: () {
                        Get.to(Scanner());
                      },
                      child: Text('Scan Qr code'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
