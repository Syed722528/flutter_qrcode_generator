import 'package:flutter/material.dart';
import 'package:flutter_qrcode_generator/utils/url_launcher.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../controllers/scanner_controller.dart';

class Scanner extends GetView<QRScannerController> {
  const Scanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        title: const Text('QR Scanner'),
        actions: [
          IconButton(
            icon: Obx(
              () => Icon(
                controller.isFlashOn.value ? Icons.flash_on : Icons.flash_off,
              ),
            ),
            onPressed: controller.toggleFlash,
          ),
          IconButton(
            icon: Obx(
              () => Icon(
                controller.isFrontCamera.value
                    ? Icons.camera_front
                    : Icons.camera_rear,
              ),
            ),
            onPressed: controller.switchCamera,
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            flex: 5,
            child: MobileScanner(
              controller: controller.scannerController,
              onDetect: (capture) {
                final List<Barcode> barcodes = capture.barcodes;
                if (barcodes.isNotEmpty) {
                  controller.scannedCode.value =
                      barcodes.first.rawValue ?? 'Failed to scan';
                }
              },
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.all(4),
              color: Colors.black,
              alignment: Alignment.center,
              child: Obx(
                () => Row(
                  spacing: 1,
                  children: [
                    Text(
                      'Scanned Code: ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap:
                            () =>
                                launchURL(controller.scannedCode.value.trim()),
                        child: Text(
                          controller.scannedCode.value.trim(),
                          style: TextStyle(color: Colors.blue, fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
