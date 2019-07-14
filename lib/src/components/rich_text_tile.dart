import 'package:flutter/material.dart';

class RichTextTileSh extends StatelessWidget {
  const RichTextTileSh({
    Key key,
    @required this.firstText,
    @required this.secondText,
  }) : super(key:key);

  final String firstText;
  final String secondText;
  
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: RichText(
        text: TextSpan(
          style: TextStyle(
            color: Theme.of(context).textTheme.title.color
          ),
          children: <TextSpan>[
            TextSpan(text: firstText, style: TextStyle(fontWeight: FontWeight.bold)),
            TextSpan(text: secondText),
          ],
        ),
      )
    );
  }
}
