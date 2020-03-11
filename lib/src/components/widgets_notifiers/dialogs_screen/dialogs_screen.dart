import 'package:flutter/material.dart';

class DialogsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, i) => Divider(height: 1),
      itemCount: 5,
      itemBuilder: (context, int i){
        return Container(
          height: 100,
          child: ListTile(
            leading: CircleAvatar(
              radius: 40,
              backgroundColor: Colors.black,
            ),
            title: Text('Sergey'),
            subtitle: Text('Lorem Ipsum...'),
            trailing: Text('20 jan'),
          )
        );
      },
    );
  }
}