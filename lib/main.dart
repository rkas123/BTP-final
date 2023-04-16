import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './screens/homescreen/home.dart';
import './screens/change_url/change_url_screen.dart';

import './api/backend_api.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => BackendApi()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const SafeArea(child: HomePage()),
        routes: {
          ChangeUrlScreen.routeName: (ctx) => const ChangeUrlScreen(),
        },
      ),
    );
  }
}
