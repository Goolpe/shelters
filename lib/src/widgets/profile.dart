import 'package:flutter/material.dart';

class ProfileSh extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: <Widget>[
          Card(
            child: Text('new')
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.place),
              title: Text('Указать местоположение'),
            )
          )
        ],
      )
    );
  }
}
