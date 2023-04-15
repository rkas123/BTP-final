/*
  SINGLETON Class
  Only one instance that is used across the application
*/

import 'dart:collection';

import 'package:flutter_tts/flutter_tts.dart';

class TextToSpeech {
  //Private Constructor
  TextToSpeech._();

  //instance
  static final instance = TextToSpeech._();

  /*
    Loop variable
    - True : loop is running
    - False : loop is not running
  */
  bool loopRunning = false;

  Queue<String> dialogues = Queue<String>();

  void addDialogue(String? newDialogue) {
    if (newDialogue == null) {
      return;
    }

    dialogues.add(newDialogue);

    if (!loopRunning) {
      loopRunning = true;
      beginLoop();
    }
  }

  Future<void> beginLoop() async {
    while (dialogues.isNotEmpty) {
      String dialogueToSpeak = dialogues.first;
      dialogues.removeFirst();

      //Process this dialogue
      FlutterTts flutterTts = FlutterTts();
      await flutterTts.speak(dialogueToSpeak);
    }

    loopRunning = false;
  }
}
