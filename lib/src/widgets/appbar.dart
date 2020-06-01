import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class SheltersAppBar extends StatelessWidget {
  SheltersAppBar({
    this.title,
    this.actions,
    this.automaticallyImplyLeading = true,
    this.leadingIcon
  }) : assert(automaticallyImplyLeading != null);

  final String title;
  final List<Widget> actions;
  final bool automaticallyImplyLeading;
  final IconData leadingIcon;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      primary: false,
      title: Text(FlutterI18n.translate(context, title ?? '')),
      centerTitle: true,
      leading: automaticallyImplyLeading
      ? IconButton(
        icon: Icon(leadingIcon ?? MdiIcons.chevronLeft),
        onPressed: () => Get.back(closeOverlays: true),
      ) : SizedBox(),
      actions: actions,
    );
  }
}