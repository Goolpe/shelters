import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          ListTile(
            title: Text('Authorization'),
            subtitle: Text('If you want to edit your profile, login'),
            trailing: FlatButton.icon(
              onPressed: (){}, 
              textColor: Colors.red,
              icon: Icon(MdiIcons.exitToApp), 
              label: Text('Logout')
            ),
          ),
          SwitchListTile(
            title: Text('Dark Theme'),
            value: true,
            onChanged: (bool val){},
          ),
          SwitchListTile(
            title: Text('Notifications'),
            value: true,
            onChanged: (bool val){},
          ),
          ListTile(
            title: Text('Language'),
            trailing: Text('English'),
          ),
        ],
      )
    );
  }
}