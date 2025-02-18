import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class GeneratorController extends GetxController {
  final globalKey = GlobalKey();
  final urlText = ''.obs;
  final getUrlController = TextEditingController();
  var generatedData = ''.obs;

  var isUrl = true.obs;

  void updateIsUrl() {
    isUrl.value = !isUrl.value;
  }

  void updateQrData() {
    urlText.value = getUrlController.text;
  }

  @override
  void onClose() {
    getUrlController.dispose();
    generatedData.value = '';
    super.onClose();
  }
}
