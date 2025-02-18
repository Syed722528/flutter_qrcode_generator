import 'dart:ui' as ui;

import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';

Future<void> shareQrCode(dynamic globalKey) async {
  try {
    await Future.delayed(Duration(milliseconds: 100));
    final boundary =
        globalKey.currentContext?.findRenderObject() as RenderRepaintBoundary;
    final image = await boundary.toImage();
    final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    final bytes = byteData?.buffer.asUint8List();

    if (bytes != null) {
      await Share.shareXFiles([
        XFile.fromData(bytes, name: 'qr_code.png', mimeType: 'image/png'),
      ]);
    }
  } catch (e) {
    Get.showSnackbar(
      GetSnackBar(title: 'Error', message: 'Error sharing Qr code'),
    );
  }
}
