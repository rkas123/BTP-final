import 'package:flutter/material.dart';

class BackendApi with ChangeNotifier {
  String _url = '';

  //getters
  String get url {
    return _url;
  }

  void notify() {
    notifyListeners();
  }

  void changeUrl(String newUrl) {
    _url = newUrl;
  }

  Future<void> apiCall({
    required String command,
    required dynamic image,
  }) async {}
}
