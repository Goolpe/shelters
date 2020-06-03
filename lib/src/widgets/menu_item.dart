import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:provider/provider.dart';
import 'package:shelters/index.dart';

class SheltersMenuItem extends StatelessWidget {
  SheltersMenuItem({
    @required this.id,
    this.widget,
    this.icon,
    this.title,
    this.subtitle,
    this.leading,
    this.authorized = true,
    this.textColor,
    this.onTap,
    this.contentPadding
  }) : assert(
    id != null && authorized != null,
    widget != null || onTap != null
  );

  final int id;
  final IconData icon;
  final String title;
  final String subtitle;
  final Widget leading;
  final Widget widget;
  final bool authorized;
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
                    : Color(0xff83b1af)
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
                          : Color(0xff83b1af)
                      )
                    ),
                    if(subtitle != null)
                      Text(subtitle, style: TextStyle(color: Color(0xff83b1af)))
                  ],
                ),
              ]
            ),
          ),
          onTap: onTap ?? () =>
            !authorized 
            ? Provider.of<LoginProvider>(context, listen: false).open()
            : Provider.of<NavigationProvider>(context, listen: false).openScreen(id, widget)
        );
      }
    );
  }
}