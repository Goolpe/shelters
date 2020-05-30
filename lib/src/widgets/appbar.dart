import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shelters/index.dart';

class SheltersAppBar extends StatelessWidget {
  SheltersAppBar({
    this.title,
    this.trailing,
    this.leadingIcon
  });

  final String title;
  final Widget trailing;
  final IconData leadingIcon;

  @override
  Widget build(BuildContext context) {
    return leadingIcon != null
    ? _child(context)
    : WillPopScope(
      onWillPop: () => Provider.of<NavigationProvider>(context, listen: false).openScreen('Menu'),
      child: _child(context)
    );
  }

  Widget _child(BuildContext context){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: IconButton(
                  icon: Icon(
                    leadingIcon ?? SheltersIcon.menu,
                    size: 24,
                    color: Colors.grey[600],
                  ),
                  onPressed: () => 
                    leadingIcon != null
                    ? Get.back()
                    : Provider.of<NavigationProvider>(context, listen: false).openScreen('Menu'),
                ),
              ),
              Text(FlutterI18n.translate(context, title ?? ''), style: TextStyle(fontSize: 18),),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: trailing ?? SizedBox()
          ) 
        ],
      ),
    );
  }
}