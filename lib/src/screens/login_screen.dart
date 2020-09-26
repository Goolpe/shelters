import 'package:flutter/material.dart';

import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import 'package:shelters/index.dart';

class LoginScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginProvider>(
      builder: (context, loginState, snapshot) {
        return SlidingUpPanel(
          controller: loginState.loginController,
          maxHeight: MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top,
          minHeight: 0,
          panel: Column(
            children: [
              SheltersAppBar(
                title: 'Authorization',
                automaticallyImplyLeading: false,
                actions: [
                  IconButton(
                    icon: const Icon(MdiIcons.close),
                    onPressed: () => Provider.of<LoginProvider>(context, listen: false).close(),
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
