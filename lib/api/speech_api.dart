import 'package:speech_to_text/speech_to_text.dart';

class SpeechApi {
  static final _speech = SpeechToText();
  static bool busy = false;

  static Future<bool> toggleRecording({
    required void Function(String text) onResult,
    required void Function(bool isListening) onListening,
  }) async {
    // If speech is already being recorded, then stop the recording

    if (_speech.isListening) {
      _speech.stop();
      busy = false;
      return true;
    }

    busy = true;

    final isAvailable = await _speech.initialize(
      onStatus: (status) {
        onListening(_speech.isListening);
      },
      onError: (e) => print('Error : $e'),
    );

    if (isAvailable) {
      _speech.listen(onResult: (value) => onResult(value.recognizedWords));
    }

    busy = false;

    return isAvailable;
  }
}
