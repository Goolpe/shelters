import 'package:flutter/material.dart';

class CustomAppBarSh extends StatefulWidget implements PreferredSizeWidget {
    CustomAppBarSh({Key key, this.title}) : preferredSize = Size.fromHeight(56.0), super(key: key);

    @override
    final Size preferredSize;
    final String title;

    @override
    _CustomAppBarShState createState() => _CustomAppBarShState();
}

class _CustomAppBarShState extends State<CustomAppBarSh>{

  String get title => widget.title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios, size: 20),
        onPressed: () => Navigator.pop(context),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      titleSpacing: 0,
    );
  }
}