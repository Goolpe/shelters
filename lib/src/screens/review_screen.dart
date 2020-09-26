import 'package:flutter/material.dart';

import 'package:shelters/index.dart';

class ReviewScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {   
    return const SheltersScaffold(
      appBar: SheltersAppBar(
        title: 'Review',
      ),
      bodyList: [
        SheltersTextfield(
          maxLines: 10,
          label: 'Comment',
        ),
        SheltersButton(
          title: 'Send',
        )
      ],
    );
  }
}
