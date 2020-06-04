import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shelters/index.dart';

class PetsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
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
                icon: Icon(MdiIcons.tune),
                onPressed: () => 
                Provider.of<AnimalsProvider>(context, listen: false).filterController.open(),
              ),
            ]
          ),
          bodyList: [
            GridView.count(
              // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //   crossAxisCount: 3,
              //   childAspectRatio: 0.8
              // ),
              // itemCount: animalsState.dataList.length,
              crossAxisCount: 3,
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              physics: NeverScrollableScrollPhysics(),
              childAspectRatio: itemWidth / itemHeight,
              children: animalsState.dataList.map((data) => AnimalMiniCard(
                tag: 'tag_animals_${data.id}',
                data: data
              )).toList(),
            ),
            // ListView.builder(
            //   shrinkWrap: true,
            //   physics: NeverScrollableScrollPhysics(),
            //   padding: EdgeInsets.zero,
            //   itemCount: animalsState.dataList.length,
            //   itemBuilder: (context, index) {
            //     return AnimalMiniCard(
            //       tag: 'tag_animals_$index',
            //       data: animalsState.dataList[index]
            //     );
            //   },
            // )
          ],
          panel: FilterScreen()
        );
      }
    );
  }
}