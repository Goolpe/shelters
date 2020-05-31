import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shelters/index.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class FilterScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Consumer<PanelProvider>(
      builder: (context, panelState, snapshot) {
        return SlidingUpPanel(
          controller: panelState.panelController,
          maxHeight: MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top,
          minHeight: 0,
          panel: Column(
            children: [
              SheltersAppBar(
                title: 'Filter',
                automaticallyImplyLeading: false,
                actions: [
                  IconButton(
                    icon: Icon(MdiIcons.close),
                    onPressed: () => Provider.of<PanelProvider>(context, listen: false).openPanel(),
                  )
                ]
              ),
            ],
          )
        );
      }
    );
  }
}