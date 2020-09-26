import 'package:flutter/material.dart';

import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import 'package:shelters/index.dart';

class AnimalsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - 180) / 2;
    final double itemWidth = size.width / 2;

    return Consumer<AnimalsProvider>(
      builder: (context, animalsState, snapshot) {
        return SheltersScaffold(
          appBar: SheltersAppBar(
            leadingIcon: SheltersIcon.menu,
            pretitle: '${animalsState.title[animalsState.conditions[2]]}',
            title: 'Pets',
            actions: [
              // IconButton(
              //   icon: Icon(MdiIcons.map),
              //   onPressed: () => 
              //   Provider.of<AnimalsProvider>(context, listen: false).filterController.open(),
              // ),
              IconButton(
                icon: const Icon(MdiIcons.tune),
                onPressed: () => 
                Provider.of<AnimalsProvider>(context, listen: false).filterController.open(),
              ),
            ]
          ),
          bodyList: [
            GridView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 8,
                mainAxisSpacing: 0,
                childAspectRatio: itemWidth / itemHeight
              ),
              itemCount: animalsState.dataList.length,
              itemBuilder: (context, index){
                final _data = animalsState.dataList[index];
                return AnimalMiniCard(
                  tag: 'tag_animals_${_data.id}',
                  data: _data
                );
              }
            ),
          ],
          panel: FilterScreen()
        );
      }
    );
  }
}
