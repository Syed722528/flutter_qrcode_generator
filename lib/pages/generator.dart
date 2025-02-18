import 'package:flutter/material.dart';
import 'package:flutter_qrcode_generator/utils/share_code.dart';
import 'package:flutter_qrcode_generator/widgets/custom_container_decoration.dart';
import 'package:flutter_qrcode_generator/widgets/custom_elevated_button.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../controllers/generator_controller.dart';

class Generator extends StatelessWidget {
  const Generator({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(GeneratorController());
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Code Generator'),
        centerTitle: true,
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Center(
          child: Container(
            margin: EdgeInsets.all(10),

            width: Get.width * 0.80,
            padding: EdgeInsets.all(20),
            decoration: customContainerDecoration(),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                spacing: 25,

                children: [
                  Obx(
                    () => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _customButton(
                          'From url',
                          controller.isUrl.value,
                          () => controller.updateIsUrl(),
                        ),
                        _customButton(
                          'From scan',
                          !controller.isUrl.value,
                          () => controller.updateIsUrl(),
                        ),
                      ],
                    ),
                  ),

                  TextField(
                    controller: controller.getUrlController,
                    decoration: InputDecoration(
                      hintText: 'Enter url',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () => controller.updateQrData(),
                    style: customElevatedButtonStyle(),
                    child: Text('Generate'),
                  ),
                  Obx(
                    () =>
                        controller.urlText.value.isNotEmpty
                            ? Column(
                              mainAxisSize: MainAxisSize.min,
                              spacing: 15,
                              children: [
                                RepaintBoundary(
                                  key: controller.globalKey,
                                  child: Container(
                                    color: Colors.white,
                                    child: QrImageView(
                                      data: controller.urlText.value,
                                      version: QrVersions.auto,
                                      size: 100,
                                    ),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        shareQrCode(controller.globalKey);
                                      },
                                      icon: Icon(Icons.share_rounded),
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.bookmark_add_outlined),
                                    ),
                                  ],
                                ),
                              ],
                            )
                            : SizedBox.shrink(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

TextButton _customButton(String text, bool isSelected, VoidCallback onTap) {
  return TextButton(
    style: TextButton.styleFrom(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      backgroundColor:
          isSelected ? Colors.black : const Color.fromARGB(255, 248, 232, 232),
      foregroundColor:
          isSelected ? const Color.fromARGB(255, 248, 232, 232) : Colors.black,
    ),
    onPressed: onTap,
    child: Text(text),
  );
}
