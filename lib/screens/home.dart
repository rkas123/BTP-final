import 'package:btp_final_app/api/backend_api.dart';
import 'package:btp_final_app/screens/assistant.dart';
import 'package:btp_final_app/screens/url_widget.dart';
import 'package:flutter/material.dart';

import '../api/speech_api.dart';
import '../api/voice_assistant.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isListening = false;
  String? text;

  Future<void> toggleRecording() => SpeechApi.toggleRecording(
        onListening: (bool isListening) {
          /*
              This method will be called twice for each sentence
              We must ensure that it is processed only once.
          */
          if (!isListening) {
            Future.delayed(const Duration(seconds: 1), () {
              // print(text);

              VoiceAssitant.instance.addCommand(text as String);
            });
          }
          setState(
            () => this.isListening = isListening,
          );
        },
        onResult: (String text) {
          // print(text);
          setState(() {
            this.text = text;
          });
        },
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          UrlWidget(),
          Assistant(),
        ],
      ),
    );
  }
}
