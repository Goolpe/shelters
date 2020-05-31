import 'package:flutter/material.dart';

class SheltersScaffold extends StatelessWidget {
  SheltersScaffold({
    this.bodyList,
    this.body,
    this.appBar,
    this.backgroundColor,
    this.panel,
  }) : assert(bodyList == null || body == null);

  final List<Widget> bodyList;
  final Widget body;
  final Widget appBar;
  final Color backgroundColor;
  final Widget panel;

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
          Padding(
            padding: EdgeInsets.only(top: 24),
            child: appBar,
          ),
        Expanded(
          child: Container(
            width: MediaQuery.of(context).size.width,
            color: backgroundColor ?? const Color(0xfff6f6f6),
            child: body
            ?? ListView(
              padding: const EdgeInsets.all(8),
              shrinkWrap: true,
              children: bodyList
            )
          )
        )
      ]
    );
  }
}