import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shelters/shelf.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class SettingsPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<SettingsPanelModel>  (
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
    return Container(
      child: Column(
        children: <Widget>[
          Text('Местоположение')
        ],
      )
    );
  }
}