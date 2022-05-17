import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:qr/qrscanneroverlay.dart';

import 'app_constants.dart';

class QrScreen extends StatefulWidget {
  const QrScreen({Key? key}) : super(key: key);

  @override
  State<QrScreen> createState() => _QrScreenState();
}

class _QrScreenState extends State<QrScreen> {
  late MobileScannerController cameraController;
  late TextEditingController textEditingController;
  @override
  void initState() {
    cameraController = MobileScannerController();
    textEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    cameraController.dispose();
    textEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: kIsWeb
          ? null
          : AppBar(
              actions: [
                IconButton(
                  onPressed: () => cameraController.switchCamera(),
                  icon: const Icon(
                    Icons.switch_camera,
                  ),
                )
              ],
            ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 800,
              child: Stack(
                children: [
                  MobileScanner(
                    onDetect: (barcode, args) {
                      debugPrint(barcode.rawValue);

                      Navigator.pop(context, barcode.rawValue);
                    },
                    controller: cameraController,
                  ),
                  QRScannerOverlay(overlayColour: AppColors.overlayColor),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
