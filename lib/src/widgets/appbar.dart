import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class SheltersAppBar extends StatelessWidget {
  SheltersAppBar({
    this.pretitle,
    this.title,
    this.actions,
    this.automaticallyImplyLeading = true,
    this.leadingIcon,
    this.backgroundColor
  }) : assert(automaticallyImplyLeading != null);

  final String pretitle;
  final String title;
  final List<Widget> actions;
  final bool automaticallyImplyLeading;
  final IconData leadingIcon;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      primary: false,
      title: Text((pretitle != null 
        ? '${FlutterI18n.translate(context, pretitle)} ' 
        : '') + 
        FlutterI18n.translate(context, title ?? '')),
      centerTitle: true,
      backgroundColor: backgroundColor,
      leading: automaticallyImplyLeading
      ? IconButton(
        icon: Icon(leadingIcon ?? MdiIcons.chevronLeft),
        onPressed: () => Get.back(),
      ) : SizedBox(),
      actions: actions,
    );
  }
}