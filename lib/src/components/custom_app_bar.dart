import 'package:flutter/material.dart';

class CustomAppBarSh extends StatefulWidget implements PreferredSizeWidget {
    CustomAppBarSh({
      Key key, 
      this.title,
      this.actions
    }) : preferredSize = Size.fromHeight(56.0), super(key: key);

    @override
    final Size preferredSize;
    final String title;
    final List<Widget> actions;

    @override
    _CustomAppBarShState createState() => _CustomAppBarShState();
}

class _CustomAppBarShState extends State<CustomAppBarSh>{

  String get title => widget.title;
  List<Widget> get actions => widget.actions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      leading: InkWell(
        child: Icon(Icons.arrow_back_ios, size: 20),
        onTap: () => Navigator.pop(context),
      ),
      actions: actions,
      elevation: 0,
      backgroundColor: Colors.transparent,
      titleSpacing: 0,
    );
  }
}