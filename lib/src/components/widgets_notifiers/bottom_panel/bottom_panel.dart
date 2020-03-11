import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shelters/shelf.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class BottomPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<BottomPanelNotifier>  (
      builder: (context, state, _){
        return SlidingUpPanel(
          backdropEnabled: true,
          maxHeight: 150,
          minHeight: 0,
          panel: _bottomPanel(),
          controller: state.controller,
        );
      }
    );
  }

  Widget _bottomPanel(){
    return SafeArea(
      child: Container(
        margin: EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            TextField()
          ],
        )
      )
    );
  }
}