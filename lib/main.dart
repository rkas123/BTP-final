import 'dart:async';

import 'package:btp_final_app/api/backend_api.dart';
import 'package:btp_final_app/api/speech_api.dart';
import 'package:flutter/material.dart';

import 'package:camera/camera.dart';

import './screens/homescreen/home.dart';
import './screens/change_url/change_url_screen.dart';

import './api/camera.dart';

// List of cameras, exported.
List<CameraDescription> ListOfCameras = [];

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ListOfCameras = await availableCameras();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void Printval() {
    print("text");
  }

  @override
  void initState() {
    Timer.periodic(const Duration(seconds: 20), (timer) async {
      //send automatic images
      print('timer');
      if (Camera.instance.busyCamera == true || SpeechApi.busy == true) {
        return;
      }

      final image = await Camera.instance.takePicture();
      await BackendApi.instance.apiCallInIntervals(image: image);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SafeArea(child: HomePage()),
      routes: {
        ChangeUrlScreen.routeName: (ctx) => const ChangeUrlScreen(),
      },
    );
  }
}
