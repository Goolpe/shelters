import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shelters/index.dart';

class SheltersScaffold extends StatelessWidget {
  SheltersScaffold({
    this.bodyList,
    this.body,
    this.appBar,
    this.backgroundColor = const Color(0xfff6f6f6),
    this.padding = const EdgeInsets.symmetric(vertical: 8),
    this.leading,
  }) : assert(bodyList == null || body == null);

  final List<Widget> bodyList;
  final Widget body;
  final Widget appBar;
  final Color backgroundColor;
  final EdgeInsets padding;
  final Widget leading;

  @override
  Widget build(BuildContext context) {
    return Consumer<NavigationProvider>(
      builder: (context, navState, snapshot) {
        return Scaffold(
          backgroundColor: Colors.transparent,
          body: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: navState.isMenu 
              ? const BorderRadius.all(Radius.circular(24)) 
              : BorderRadius.zero,
            ),
            child: ClipRRect(
              borderRadius: navState.isMenu 
              ? const BorderRadius.all(Radius.circular(24)) 
              : BorderRadius.zero,
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Column(
                  children: [
                    appBar ?? SizedBox(),
                    Expanded(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        color: backgroundColor,
                        padding: padding,
                        child: body
                        ?? ListView(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          children: bodyList
                        )
                      )
                    )
                  ]
                )
              )
            )
          )
        );
      }
    );
  }
}