import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shelters/index.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({
    this.title
  });

  final String title;

  final List<String> _animals = ['All','Cats','Dogs','Birds'];

  @override
  Widget build(BuildContext context) {
    return SheltersScaffold(
      appBar: SheltersAppBar(
        leading: IconButton(
          icon: Icon(SheltersIcon.menu),
          onPressed: () => Get.back(),
        ),
        title: title ?? '',
        actions: [
          IconButton(
            icon: Icon(MdiIcons.tune),
            onPressed: () => 
            Provider.of<PanelProvider>(context, listen: false).openPanel(),
          ),
        ]
      ),
      bodyList: [
        _shortPets(),
        Column(
          children: List.generate(3, (index){
            return AnimalMiniCard(
              tag: 'tag_${title}_$index'
            );
          })
        )
      ],
      panel: FilterScreen()
    );
  }

  Widget _shortPets(){
    return Container(
      height: 110,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _animals.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              SheltersButton(
                height: 70,
                color: index != 0 ? Colors.white : null,
                elevation: index == 0 ? 0 : 10,
                child: Icon(SheltersIcon.fromString(_animals[index] ?? ''), 
                  size: 40,
                  color: index == 0 
                  ? Colors.white 
                  : Colors.black
                )
              ),
              Text(FlutterI18n.translate(context, _animals[index]))
            ],
          );
        },
      ),
    );
  }
}