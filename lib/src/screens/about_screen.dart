import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:shelters/index.dart';

class AboutAppScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {   
    return SheltersScaffold(
      appBar: SheltersAppBar(
        title: 'About App',
        leading: IconButton(
          icon: Icon(MdiIcons.chevronLeft, size: 30),
          onPressed: () => Get.back(),
        ),
        trailing: Text('v: 1.0'),
      ),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      body: Container(
        alignment: Alignment.center,
      ),
    );
  }
}