import 'package:flutter/material.dart';

class FilterTileSh extends StatelessWidget {
  const FilterTileSh({
    Key key, 
    @required this.secondPart,
    @required this.label
  }) : super(key:key);

  final String label;
  final Widget secondPart;
  
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(label, style: TextStyle(fontSize: 18)),
        secondPart
      ]
    );
  }
}
