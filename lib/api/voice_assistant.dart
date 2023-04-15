/*
  SINGLETON Class
  Only one instance that is used across the application
*/

import 'dart:collection';

import './text_to_speech.dart';

class VoiceAssitant {
  //Private Constructor
  VoiceAssitant._();

  //instance
  static final instance = VoiceAssitant._();

  //Keep track of last processed command
  String? lastCommand;

  /*
    Loop variable
    - True : loop is running
    - False : loop is not running
  */
  bool loopRunning = false;

  Queue<String> commands = Queue<String>();

  void addCommand(String? newCommand) {
    if (newCommand == null) return;

    commands.add(newCommand);
    if (!loopRunning) {
      loopRunning = true;
      beginLoop();
    }
  }

  Future<void> beginLoop() async {
    while (commands.isNotEmpty) {
      String commandToProcess = commands.first;
      commands.removeFirst();

      if (lastCommand == null || lastCommand != commandToProcess) {
        //Processing
        // await Future.delayed(const Duration(seconds: 10));
        TextToSpeech.instance.addDialogue(commandToProcess);
        lastCommand = commandToProcess;
      }
    }

    loopRunning = false;
  }
}
