import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shelters/index.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<PanelProvider>(
        builder: (context, value, snapshot) {
          return SlidingUpPanel(
            minHeight: 0,
            maxHeight: MediaQuery.of(context).size.height - 20,
            backdropEnabled: true,
            renderPanelSheet: false,
            panelBuilder: (ScrollController sc) => 
              AnimalScreen(
              id: value.id, 
              scrollController: sc
            ),
            controller: value.panelController,
            body: NavigationScreen()
          );
        }
      )
    );
  }
}