import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:shelters/index.dart';

class ProfileScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SheltersScaffold(
      appBar: SheltersAppBar(
        leadingIcon: SheltersIcon.menu,
        title: 'Profile'
      ),
      bodyList: <Widget>[
        Container(
          margin: EdgeInsets.all(8),
          child: DottedBorder(
            borderType: BorderType.Circle,
            color: Theme.of(context).accentColor,
            strokeWidth: 1,
            strokeCap: StrokeCap.butt,
            padding: EdgeInsets.all(8),
            dashPattern: [6, 6, 6, 6], 
            child: Center(
              child: CircleAvatar(
                radius: 40,
                backgroundColor: Theme.of(context).accentColor,
                child: Icon(MdiIcons.camera, size: 40, color: Colors.white)
              )
            )
          ),
        ),
        SheltersTextfield(
          label: 'Name',
        ),
      ],
    );
  }
}