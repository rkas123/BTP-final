import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../api/backend_api.dart';

import '../../screens/change_url/change_url_screen.dart';

class UrlWidget extends StatelessWidget {
  const UrlWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final backendApi = Provider.of<BackendApi>(context);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Text(
            backendApi.url,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        IconButton(
          icon: const Icon(Icons.edit),
          onPressed: () {
            Navigator.of(context).pushNamed(ChangeUrlScreen.routeName);
          },
        ),
      ],
    );
  }
}
