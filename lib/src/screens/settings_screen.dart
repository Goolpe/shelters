import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shelters/index.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SheltersScaffold(
      appBar: SheltersAppBar(
        title: 'Settings'
      ),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      bodyList: [
        SheltersSwitchListTile(
          title: 'Dark Theme',
          value: false,
          onChanged: (bool val){},
        ),
        SheltersSwitchListTile(
          title: 'Notifications',
          value: true,
          onChanged: (bool val){},
        ),
        ListTile(
          contentPadding: EdgeInsets.zero,
          title: Text('About App', style: TextStyle(fontSize: 18)),
          onTap: () => Get.to(AboutAppScreen(), transition: Transition.cupertino),
        ),
        ListTile(
          contentPadding: EdgeInsets.zero,
          title: Text('Help', style: TextStyle(fontSize: 18)),
        ),
      ],
    );
  }
}