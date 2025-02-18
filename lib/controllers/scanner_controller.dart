import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QRScannerController extends GetxController {
  final scannerController = MobileScannerController();
  RxString scannedCode = ''.obs;
  RxBool isFlashOn = false.obs;
  RxBool isFrontCamera = false.obs;

  void toggleFlash() {
    scannerController.toggleTorch();
    isFlashOn.value = !isFlashOn.value;
  }

  void switchCamera() {
    scannerController.switchCamera();
    isFrontCamera.value = !isFrontCamera.value;
  }

  @override
  void onClose() {
    scannerController.dispose();
    super.onClose();
  }
}
