import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../api/backend_api.dart';

class UrlTextField extends StatefulWidget {
  const UrlTextField({
    Key? key,
  }) : super(key: key);

  @override
  State<UrlTextField> createState() => _UrlTextFieldState();
}

class _UrlTextFieldState extends State<UrlTextField> {
  final TextEditingController _urlController = TextEditingController();

  @override
  void dispose() {
    _urlController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final backendApiProvider = Provider.of<BackendApi>(
      context,
    );

    _urlController.text = backendApiProvider.url;

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TextField(
          decoration: const InputDecoration(labelText: 'Enter/edit url'),
          controller: _urlController,
        ),
        ElevatedButton(
          onPressed: () {
            backendApiProvider.changeUrl(_urlController.text);
          },
          child: const Text('Update'),
        ),
      ],
    );
  }
}
