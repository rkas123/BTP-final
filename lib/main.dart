import 'package:flutter/material.dart';

import 'package:camera/camera.dart';

import './screens/homescreen/home.dart';
import './screens/change_url/change_url_screen.dart';

// List of cameras, exported.
List<CameraDescription> ListOfCameras = [];

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ListOfCameras = await availableCameras();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
