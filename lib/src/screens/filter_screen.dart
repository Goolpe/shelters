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
          color: Theme.of(context).scaffoldBackgroundColor,
          onPanelClosed: (){
            Provider.of<AnimalsProvider>(context, listen: false).cancelData();
          },
          panel: Stack(
            children: [
              Column(
                children: [
                  SheltersAppBar(
                    title: 'Filters',
                    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                    automaticallyImplyLeading: false,
                    actions: [
                      IconButton(
                        icon: Icon(MdiIcons.close),
                        onPressed: () => 
                        Provider.of<AnimalsProvider>(context, listen: false).filterController.close(),
                      )
                    ]
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                          margin: EdgeInsets.all(8),
                          child: CupertinoSlidingSegmentedControl(
                            groupValue: animalsState.tempConditions[2],
                            onValueChanged: (int index){
                              Provider.of<AnimalsProvider>(context, listen: false).updateData(2, index);
                            },
                            children: _getMap(animalsState.title),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(FlutterI18n.translate(context, 'Genus'), style: TextStyle(fontSize: 18)),
                        ),
                        _shortPets(animalsState),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(FlutterI18n.translate(context, 'Gender'), style: TextStyle(fontSize: 18)),
                        ),
                        Container(
                          margin: EdgeInsets.all(8),
                          child: CupertinoSlidingSegmentedControl(
                            groupValue: animalsState.tempConditions[1],
                            onValueChanged: (int index){
                              Provider.of<AnimalsProvider>(context, listen: false).updateData(1, index);
                            },
                            children: _getMap(animalsState.gender),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              Positioned(
                bottom: 15,
                right: 15,
                child: ButtonTheme(
                  height: 50,
                  minWidth: 100,
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)
                    ),
                    color: Theme.of(context).accentColor,
                    child: Text(FlutterI18n.translate(context, 'Done'), style: TextStyle(fontSize: 18, color: Colors.white)),
                    onPressed: (){ 
                      Provider.of<AnimalsProvider>(context, listen: false).update();
                      Provider.of<AnimalsProvider>(context, listen: false).filterController.close();
                    }
                  ),
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
                color: index != animalsState.tempConditions[0] ? Theme.of(context).cardColor : Theme.of(context).accentColor,
                elevation: index == animalsState.tempConditions[0] ? 0 : 4,
                child: Icon(SheltersIcon.fromString(animalsState.genus[index] ?? ''), 
                  size: 40,
                  color: index == animalsState.tempConditions[0] 
                  ? Colors.white
                  : Theme.of(context).textTheme.button.color
                ),
                onPressed: () => 
                  Provider.of<AnimalsProvider>(context, listen: false).updateData(0, index),
              ),
              Text(FlutterI18n.translate(context, animalsState.genus[index]))
            ],
          );
        },
      ),
    );
  }

  Map<int, Widget> _getMap(List<String> data){
    Map<int, Widget> _result = {};

    for(int i = 0; i < data.length; i++){
      _result[i] = _segmentControl(data[i]);
    }

    return _result;
  }

  Widget _segmentControl(String title){
    return Container(
      height: 50,
      alignment: Alignment.center,
      child: Text(FlutterI18n.translate(context, title ?? ''), style: TextStyle(fontSize: 18))
    );
  }
}