import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shelters/shelf.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class SettingsPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<SettingsPanelNotifier>  (
      builder: (context, state, _){
        return SlidingUpPanel(
          backdropEnabled: true,
          slideDirection: SlideDirection.DOWN,
          maxHeight: 150,
          minHeight: 0,
          panel: _settingsPanel(),
          controller: state.controller,
        );
      }
    );
  }

  Widget _settingsPanel(){
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