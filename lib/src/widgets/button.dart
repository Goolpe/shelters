import 'package:flutter/material.dart';

import 'package:flutter_i18n/flutter_i18n.dart';

class SheltersButton extends StatelessWidget {
  const SheltersButton({
    this.title,
    this.height,
    this.child,
    this.color,
    this.elevation,
    this.margin,
    this.onPressed
  });

  final String title;
  final double height;
  final Widget child;
  final Color color;
  final double elevation;
  final double margin;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      child: ButtonTheme(
        height: height ?? 56,
        minWidth: 70,
        child: RaisedButton(
          highlightElevation: 0,
          elevation: elevation ?? 0,
          color: color ?? Theme.of(context).primaryColor,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(16)
            )
          ),
          child: child ?? Text(FlutterI18n.translate(context, title ?? ''), 
            style: const TextStyle(color: Colors.white, fontSize: 18)
          ),
          onPressed: onPressed ?? (){},
        ),
      ),
    );
  }
}

class SheltersOutlineButton extends StatelessWidget {
  const SheltersOutlineButton({
    this.height,
    this.icon,
    this.title
  });

  final double height;
  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      child: ButtonTheme(
        height: height ?? 54,
        minWidth: 50,
        child: OutlineButton(
          highlightedBorderColor: Theme.of(context).accentColor,
          borderSide: BorderSide(color: Theme.of(context).accentColor),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(16)
            )
          ),
          color: Theme.of(context).accentColor,
          textColor: Theme.of(context).accentColor,
          child: icon != null ? Icon(icon) : Text(title, style: const TextStyle(fontSize: 24)),
          onPressed: (){},
        ),
      )
    );
  }
}
