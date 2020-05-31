import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';

class SheltersAppBar extends StatelessWidget {
  SheltersAppBar({
    this.title,
    this.actions,
    this.leading,
    this.automaticallyImplyLeading
  });

  final String title;
  final List<Widget> actions;
  final Widget leading;
  final bool automaticallyImplyLeading;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      primary: false,
      title: Text(FlutterI18n.translate(context, title ?? '')),
      centerTitle: true,
      automaticallyImplyLeading: automaticallyImplyLeading ?? true,
      leading: leading,
      actions: actions,
    );
  }
}