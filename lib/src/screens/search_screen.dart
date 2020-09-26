import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import 'package:shelters/index.dart';

class SearchScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SheltersScaffold(
      appBar: SheltersAppBar(
        title: 'Location',
        automaticallyImplyLeading: false,
        actions: [
          FlatButton(
            child: const Text('Cancel'),
            onPressed: () => Navigator.pop(context),
          )
        ],
      ),
      padding: EdgeInsets.zero,
      bodyList: [
        // SheltersTextfield(),
        Consumer<AnimalsProvider>(
          builder: (context, animalsState, snapshot) {
            return ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              itemCount: animalsState.location.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(animalsState.location[index]),
                  trailing: animalsState.tempConditions[3] == index 
                  ? const Icon(MdiIcons.homeMapMarker) 
                  : const SizedBox.shrink(),
                  onTap: (){ 
                    Provider.of<AnimalsProvider>(context, listen: false).updateTempData(3, index);
                    Navigator.pop(context);
                  }
                );
              },
            );
          }
        )
      ]
    );
  }
}
