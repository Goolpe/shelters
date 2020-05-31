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
  });

  final String title;
  final double height;
  final Widget child;
  final Color color;
  final double elevation;
  final double margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
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
            style: TextStyle(color: Colors.white)
          ),
          onPressed: (){},
        ),
      ),
    );
  }
}

class SheltersOutlineButton extends StatelessWidget {
  SheltersOutlineButton({
    this.height,
    this.icon
  });

  final double height;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      child: ButtonTheme(
        height: height ?? 56,
        minWidth: 50,
        child: OutlineButton(
          highlightedBorderColor: Theme.of(context).accentColor,
          borderSide: BorderSide(color: Theme.of(context).accentColor),
          shape: RoundedRectangleBorder(
            borderRadius: const BorderRadius.all(
              Radius.circular(16)
            )
          ),
          color: Theme.of(context).accentColor,
          child: icon != null ? Icon(icon) : SizedBox(),
          onPressed: (){},
        ),
      )
    );
  }
}