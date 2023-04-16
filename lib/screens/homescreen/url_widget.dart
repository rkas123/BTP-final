import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../api/backend_api.dart';

class UrlWidget extends StatelessWidget {
  const UrlWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final backendApi = Provider.of<BackendApi>(context);

    return Row(
      children: [
        Expanded(child: Text(backendApi.url)),
        const SizedBox(
          width: 5,
        ),
        IconButton(
          icon: const Icon(Icons.edit),
          onPressed: () {
            print('Pressed');
          },
        ),
      ],
    );
  }
}
