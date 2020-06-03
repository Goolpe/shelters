import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shelters/index.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class FilterScreen extends StatefulWidget {

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {

  @override
  Widget build(BuildContext context) {
    return Consumer<AnimalsProvider>(
      builder: (context, animalsState, snapshot) {
        return SlidingUpPanel(
          controller: animalsState.filterController,
          maxHeight: MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top,
          minHeight: 0,
          panel: Stack(
            children: [
              Column(
                children: [
                  SheltersAppBar(
                    title: 'Filters',
                    automaticallyImplyLeading: false,
                    actions: [
                      IconButton(
                        icon: Icon(MdiIcons.close),
                        onPressed: () => Provider.of<AnimalsProvider>(context, listen: false).closePanel(),
                      )
                    ]
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(FlutterI18n.translate(context, 'Genus'), style: TextStyle(fontSize: 24)),
                        ),
                        _shortPets(animalsState),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(FlutterI18n.translate(context, 'Gender'), style: TextStyle(fontSize: 24)),
                        ),
                        Container(
                          margin: EdgeInsets.all(8),
                          child: CupertinoSlidingSegmentedControl(
                            groupValue: animalsState.genderNow,
                            onValueChanged: (int index){
                              Provider.of<AnimalsProvider>(context, listen: false).genderUpdate(index);
                            },
                            children: animalsState.genders,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: RaisedButton(
                  child: Text(FlutterI18n.translate(context, 'Done')),
                  onPressed: (){
                    Provider.of<AnimalsProvider>(context, listen: false).update();
                    Provider.of<AnimalsProvider>(context, listen: false).closePanel();
                  }
                ),
              )
            ],
          )
        );
      }
    );
  }

  Widget _shortPets(AnimalsProvider animalsState){
    return Container(
      height: 110,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: animalsState.genus.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              SheltersButton(
                height: 70,
                color: index != animalsState.genusNow ? Colors.white : null,
                elevation: index == animalsState.genusNow ? 0 : 10,
                child: Icon(SheltersIcon.fromString(animalsState.genus[index] ?? ''), 
                  size: 40,
                  color: index == animalsState.genusNow 
                  ? Colors.white 
                  : Colors.black
                ),
                onPressed: () => 
                  Provider.of<AnimalsProvider>(context, listen: false).genusUpdate(index),
              ),
              Text(FlutterI18n.translate(context, animalsState.genus[index]))
            ],
          );
        },
      ),
    );
  }
}