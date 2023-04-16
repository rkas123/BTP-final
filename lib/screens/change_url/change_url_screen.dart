import 'package:flutter/material.dart';

import './url_text_field.dart';

class ChangeUrlScreen extends StatelessWidget {
  static const routeName = '/change-url-screen';

  const ChangeUrlScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
        floatingActionButton: IconButton(
          onPressed: () {
            Navigator.of(context).pushReplacementNamed('/');
          },
          icon: const Icon(
            Icons.arrow_back,
          ),
        ),
        body: const Center(
          child: SizedBox(
            height: 200,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: UrlTextField(),
            ),
          ),
        ),
      ),
    );
  }
}
