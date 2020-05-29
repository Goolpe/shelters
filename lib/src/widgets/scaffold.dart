import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shelters/index.dart';

class SheltersScaffold extends StatelessWidget {
  SheltersScaffold({
    this.body
  });

  final Widget body;

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
              ? BorderRadius.circular(24) 
              : BorderRadius.zero,
            ),
            child: ClipRRect(
              borderRadius: navState.isMenu 
              ? BorderRadius.circular(24) 
              : BorderRadius.zero,
              child: body
            )
          )
        );
      }
    );
  }
}