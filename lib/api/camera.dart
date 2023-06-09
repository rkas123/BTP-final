import 'dart:io';

import 'package:camera/camera.dart';

import '../main.dart';

class Camera {
  late CameraController controller;

  bool flashState = false;

  bool busyCamera = false;
  /*
      false --> Flash OFF
      true  --> Flash ON
  */
  Camera._() {
    // List of Cameras imported from main.dart
    controller = CameraController(ListOfCameras[0], ResolutionPreset.medium);
  }

  static final instance = Camera._();

  Future<dynamic> takePicture() async {
    busyCamera = true;
    print("BUSY CAMERA +++++++++++++++++");
    await controller.initialize();
    controller.setFlashMode(FlashMode.off);

    final image = await controller.takePicture();
    var file = File(image.path);

    busyCamera = false;
    print("CAMERA FREE ----------------");
    return file;
  }

  void setFlashMode(bool state) {
    flashState = state;
  }

  FlashMode getFlashMode() {
    switch (flashState) {
      case true:
        return FlashMode.torch;
      case false:
        return FlashMode.off;
      default:
        return FlashMode.off;
    }
  }
}
