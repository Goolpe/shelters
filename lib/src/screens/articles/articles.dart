import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:shelters/shelf.dart';

class ArticlesSh extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return ListView(
      children: <Widget>[
        ListTile(
          title: const Text('Интересное'),
          subtitle: const Text('Советы, статьи и не только'),
        ),
        CustomListSh(url: URL)
      ],
    );
  }
}
