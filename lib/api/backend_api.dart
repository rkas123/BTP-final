class BackendApi {
  //Private Constructor
  BackendApi._();

  //instance
  static final instance = BackendApi._();

  String _url = '';

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
  }) async {}
}
