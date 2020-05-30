import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:shelters/index.dart';

class ReviewScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {   
    return SheltersScaffold(
      appBar: SheltersAppBar(
        title: 'Review',
        leadingIcon: MdiIcons.chevronLeft,
        trailing: SheltersButton(
          title: 'Send',
        )
      ),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      bodyList: [
        SheltersTextfield(
          maxLines: 10,
          label: 'Comment',
        )
      ],
    );
  }
}