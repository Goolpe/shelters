import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shelters/shelf.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class SettingsPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsPanelBloc, SettingsPanelState>  (
      builder: (context, SettingsPanelState state){
        if(state is SettingsPanelInitial){
          return SlidingUpPanel(
            backdropEnabled: true,
            slideDirection: SlideDirection.DOWN,
            maxHeight: 150,
            minHeight: 0,
            panel: _settingsPanel(),
            controller: state.controller,
          );
        }
        return SizedBox();
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