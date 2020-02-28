import 'package:flutter/material.dart';

class Avatar extends StatelessWidget{
  Avatar({
    @required this.url,
    @required this.title
  });

  final String url;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: url.isEmpty
            ? CircleAvatar(
              radius: MediaQuery.of(context).size.width/8,
              backgroundColor: Colors.grey[200],
            )
            : CircleAvatar(
              radius: MediaQuery.of(context).size.width/8,
              backgroundImage: NetworkImage(url),
              backgroundColor: Colors.grey[200],
            )
          ),
        ),
        Text(title)
      ]
    );
  }
}