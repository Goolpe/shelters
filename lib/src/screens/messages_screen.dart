import 'package:flutter/material.dart';

import 'package:shelters/index.dart';

class MessagesScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return const SheltersScaffold(
      appBar: SheltersAppBar(
        leadingIcon: SheltersIcon.menu,
        title: 'Messages'
      ),
      bodyList: [
      ],
    );
  }
}
