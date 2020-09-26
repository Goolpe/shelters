import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:dotted_border/dotted_border.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'package:shelters/index.dart';

class ProfileScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SheltersScaffold(
      appBar: const SheltersAppBar(
        leadingIcon: SheltersIcon.menu,
        title: 'Profile'
      ),
      bodyList: <Widget>[
        Container(
          margin: const EdgeInsets.all(8),
          child: DottedBorder(
            borderType: BorderType.Circle,
            color: Theme.of(context).accentColor,
            strokeWidth: 1,
            strokeCap: StrokeCap.butt,
            padding: const EdgeInsets.all(8),
            dashPattern: List.generate(4, (index) => 6), 
            child: Center(
              child: CircleAvatar(
                radius: 40,
                backgroundColor: Theme.of(context).accentColor,
                child: const Icon(MdiIcons.camera, size: 40, color: Colors.white)
              )
            )
          ),
        ),
        const SheltersTextfield(
          label: 'Name',
        ),
      ],
    );
  }
}
