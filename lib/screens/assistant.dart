import 'package:flutter/material.dart';

import 'package:avatar_glow/avatar_glow.dart';

import '../api/speech_api.dart';
import '../api/voice_assistant.dart';

class Assistant extends StatefulWidget {
  const Assistant({Key? key}) : super(key: key);

  @override
  State<Assistant> createState() => _AssistantState();
}

class _AssistantState extends State<Assistant> {
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
    return Center(
      child: AvatarGlow(
        animate: isListening,
        glowColor: Colors.red,
        endRadius: 75,
        child: IconButton(
          onPressed: toggleRecording,
          icon:
              isListening ? const Icon(Icons.mic) : const Icon(Icons.mic_none),
        ),
      ),
    );
  }
}
