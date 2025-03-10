import 'package:flutter/material.dart';
import 'package:flutter_qrcode_generator/pages/home_page.dart';
import 'package:get/get.dart';

import 'controllers/scanner_controller.dart';

void main() {
  Get.put(QRScannerController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Qr code scanner and generator',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
