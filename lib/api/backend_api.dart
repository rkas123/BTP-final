import 'dart:convert';

import 'package:btp_final_app/api/text_to_speech.dart';
import 'package:http/http.dart' as http;

import 'package:http_parser/http_parser.dart';

class BackendApi {
  //Private Constructor
  BackendApi._();

  //instance
  static final instance = BackendApi._();

  String _url = 'http://192.168.1.8:5000/';

  //getters
  String get url {
    return _url;
  }

  void changeUrl(String newUrl) {
    _url = newUrl;
  }

  Future<void> apiCall({
    required String command,
    required dynamic image,
  }) async {
    final Url = Uri.parse('${_url}/raahi/voice_command');
    Map<String, String> headers = {"Content-type": "multipart/form-data"};
    var request = http.MultipartRequest('POST', Url);

    request.files.add(
      http.MultipartFile(
        'image',
        image.readAsBytes().asStream(),
        image.lengthSync(),
        filename: 'filename',
        contentType: MediaType('image', 'jpg'),
      ),
    );

    request.fields['command'] = command;

    final res = await request.send();
    final respStr = await res.stream.bytesToString();

    final toSpeak = json.decode(respStr)['command'];
    TextToSpeech.instance.addDialogue(toSpeak);
  }
}
