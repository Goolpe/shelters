import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget{
  CustomListTile({
    this.icon,
    this.title = '',
    this.trailing = const SizedBox(),
    this.onTap,
    this.showDivider = true,
    this.titleColor,
    this.paddingTrailing = true
  });

  final IconData icon;
  final String title;
  final Widget trailing;
  final Function onTap;
  final bool showDivider;
  final Color titleColor;

  //dropdownButton padding
  final bool paddingTrailing;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        showDivider
        ? Padding(
          padding: EdgeInsets.only(left: 16),
          child: Divider(
            height: 0, 
            color: Theme.of(context).textTheme.body2.color
          ),
        ) : const SizedBox(),
        Theme(
          data: onTap == null
          ? ThemeData(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ) : ThemeData(),
          child: Material(
            child: InkWell(
              child: Container(
                // color: Theme.of(context).backgroundColor,
                padding: EdgeInsets.symmetric(horizontal: 16),
                height: 50,
                child: Row(
                  children: <Widget>[
                    icon != null
                    ? Container(
                      alignment: Alignment.centerLeft,
                      width: 35,
                      child: Icon(icon, color: Theme.of(context).textTheme.body2.color),
                    )
                    : SizedBox(),
                    Expanded(
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: Text(title, style: titleColor != null 
                              ? TextStyle(color: titleColor) 
                              : Theme.of(context).textTheme.body2),
                          ),
                          Expanded(
                            flex: 2,
                            child:  Padding(
                              padding: EdgeInsets.only(left: paddingTrailing ? 16 : 0),
                              child: trailing
                            )
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              onTap: onTap,
            ),
          ),
        )
      ]
    );
  }
}