import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget{
  CustomListTile({
    this.title = const SizedBox(),
    this.trailing = const SizedBox(),
  });

  final Widget title;
  final Widget trailing;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      height: 50,
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: title,
          ),
          Expanded(
            flex: 2,
            child: trailing,
          ),
        ],
      )
    );
  }
}