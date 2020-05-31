import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shelters/index.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  @override
  Widget build(BuildContext context) {
    return Consumer<SettingsProvider>(
      builder: (BuildContext context, SettingsProvider settingsState, Widget snapshot) {
        return SheltersScaffold(
          appBar: SheltersAppBar(
            leading: IconButton(
              icon: const Icon(SheltersIcon.menu),
              onPressed: () => Get.back(),
            ),
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
    );
  }
}