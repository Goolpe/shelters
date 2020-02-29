import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shelters/shelf.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class AnimalsApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AnimalsAppState();
}

class _AnimalsAppState extends State<AnimalsApp> {

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Navigation(),
        BlocConsumer<SlidingPanelBloc, SlidingPanelState>  (
          listener: (context, SlidingPanelState state){

          },
          builder: (context, SlidingPanelState state){
            if(state is SlidingPanelInitial){
              return SlidingUpPanel(
                renderPanelSheet: false,
                maxHeight: MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top,
                minHeight: 0,
                controller: state.controller,
                panel: state.url.isEmpty ? SizedBox() : AnimalPage(url: state.url),
              );
            }
            return SizedBox();
          }
        )
      ]
    );
  }
}