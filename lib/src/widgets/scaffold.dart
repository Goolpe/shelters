import 'package:flutter/material.dart';

class SheltersScaffold extends StatelessWidget {
  SheltersScaffold({
    this.bodyList,
    this.body,
    this.appBar,
    this.panel,
    this.padding
  }) : assert(bodyList == null || body == null);

  final List<Widget> bodyList;
  final Widget body;
  final Widget appBar;
  final Widget panel;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            _child(context),
            panel ?? const SizedBox()
          ]
        )
      )
    );
  }

  Widget _child(BuildContext context){
    return Column(
      children: [
        if(appBar != null)
          Container(
            padding: EdgeInsets.only(top: 24),
            child: appBar,
          ),
        Expanded(
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: body
            ?? ListView(
              physics: BouncingScrollPhysics(),
              padding: padding ?? const EdgeInsets.all(8),
              children: bodyList
            )
          )
        )
      ]
    );
  }
}