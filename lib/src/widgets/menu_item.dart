import 'package:flutter/material.dart';

import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:provider/provider.dart';

import 'package:shelters/index.dart';

class SheltersMenuItem extends StatelessWidget {
  const SheltersMenuItem({
    @required this.id,
    this.widget,
    this.icon,
    this.title,
    this.subtitle,
    this.leading,
    this.textColor,
    this.onTap,
    this.contentPadding
  }) : assert(
    id != null,
    widget != null || onTap != null
  );

  final int id;
  final IconData icon;
  final String title;
  final String subtitle;
  final Widget leading;
  final Widget widget;
  final Color textColor;
  final Function() onTap;
  final EdgeInsets contentPadding;

  @override
  Widget build(BuildContext context) {
    return Consumer<NavigationProvider>(
      builder: (context, navState, snapshot) {
        return InkWell(
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          child: ListTile(
            contentPadding: contentPadding,
            title: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: leading ?? Icon(icon, 
                    color: navState.activeId == id
                    ? Colors.white 
                    : Theme.of(context).splashColor
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(FlutterI18n.translate(context, title ?? ''), 
                      style: TextStyle(
                        fontSize: 18,
                        color: textColor != null 
                        ? textColor  
                        : leading != null || navState.activeId == id
                          ? Colors.white 
                          : Theme.of(context).splashColor
                      )
                    ),
                    if(subtitle != null)
                      Text(FlutterI18n.translate(context, subtitle ?? ''), style: TextStyle(color: Theme.of(context).splashColor))
                  ],
                ),
              ]
            ),
          ),
          onTap: onTap ?? () {
            Navigator.push(context, 
              MaterialPageRoute(builder: (context) => 
                Hero(
                  tag: 'nav_$id',
                  child: widget
                )
              )
            );
            Provider.of<NavigationProvider>(context, listen: false).openScreen(id, widget);
          }
        );
      }
    );
  }
}
