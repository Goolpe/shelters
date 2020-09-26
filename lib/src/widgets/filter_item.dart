import 'package:flutter/material.dart';

import 'package:flutter_i18n/flutter_i18n.dart';

class SheltersFilterItem extends StatelessWidget {
  const SheltersFilterItem({
    this.title,
    this.child
  });

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if(title != null)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(FlutterI18n.translate(context, title ?? ''), style: const TextStyle(fontSize: 18)),
          ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: child
        )
      ],
    );
  }
}
