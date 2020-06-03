import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shelters/index.dart';

class AnimalsScreen extends StatelessWidget {
  AnimalsScreen({
    @required this.title
  }) : assert(title != null);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Consumer<AnimalsProvider>(
      builder: (context, animalsState, snapshot) {
        return SheltersScaffold(
          appBar: SheltersAppBar(
            leadingIcon: SheltersIcon.menu,
            title: title ?? '',
            actions: [
              IconButton(
                icon: Icon(MdiIcons.map),
                onPressed: () => 
                Provider.of<AnimalsProvider>(context, listen: false).openPanel(),
              ),
              IconButton(
                icon: Icon(MdiIcons.tune),
                onPressed: () => 
                Provider.of<AnimalsProvider>(context, listen: false).openPanel(),
              ),
            ]
          ),
          bodyList: [
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              itemCount: animalsState.dataList.length,
              itemBuilder: (context, index) {
                return AnimalMiniCard(
                  tag: 'tag_${title}_$index',
                  data: animalsState.dataList[index]
                );
              },
            )
          ],
          panel: FilterScreen()
        );
      }
    );
  }
}