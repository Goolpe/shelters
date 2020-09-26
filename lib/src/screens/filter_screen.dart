import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import 'package:shelters/index.dart';

class FilterScreen extends StatelessWidget {

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
              ListView(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                physics: const BouncingScrollPhysics(),
                children: [
                  SheltersAppBar(
                    title: 'Filters',
                    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                    automaticallyImplyLeading: false,
                    actions: [
                      IconButton(
                        icon: const Icon(MdiIcons.close),
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
                        SheltersFilterItem(
                          child: CupertinoSlidingSegmentedControl(
                            groupValue: animalsState.tempConditions[2],
                            onValueChanged: (int index){
                              Provider.of<AnimalsProvider>(context, listen: false).updateTempData(2, index);
                            },
                            children: _getMap(animalsState.title, context),
                          ),
                        ),
                        SheltersFilterItem(
                          title: 'Location',
                          child: GestureDetector(
                            child: Container(
                              height: 50,
                              alignment: Alignment.centerLeft,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Theme.of(context).cardColor
                              ),
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                              child: Text(animalsState.location[animalsState.tempConditions[3]], 
                                style: const TextStyle(fontSize: 18),)
                            ),
                            onTap: () => Navigator.push(context, 
                              MaterialPageRoute(builder: (context) =>
                                SearchScreen()
                              ),
                            )
                          )
                        ),
                        SheltersFilterItem(
                          title: 'Genus',
                          child: _shortPets(animalsState),
                        ),
                        SheltersFilterItem(
                          title: 'Gender',
                          child: CupertinoSlidingSegmentedControl(
                            groupValue: animalsState.tempConditions[1],
                            onValueChanged: (int index){
                              Provider.of<AnimalsProvider>(context, listen: false).updateTempData(1, index);
                            },
                            children: _getMap(animalsState.gender, context),
                          ),
                        ),
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
                    child: Text(FlutterI18n.translate(context, 'Done'), style: const TextStyle(fontSize: 18, color: Colors.white)),
                    onPressed: (){ 
                      Provider.of<AnimalsProvider>(context, listen: false).updateData();
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
                  Provider.of<AnimalsProvider>(context, listen: false).updateTempData(0, index),
              ),
              Text(FlutterI18n.translate(context, animalsState.genus[index]))
            ],
          );
        },
      ),
    );
  }

  Map<int, Widget> _getMap(List<String> data, BuildContext context){
    final _result = <int, Widget>{};

    for(int i = 0; i < data.length; i++){
      _result[i] = _segmentControl(data[i], context);
    }

    return _result;
  }

  Widget _segmentControl(String title, BuildContext context){
    return Container(
      height: 50,
      alignment: Alignment.center,
      child: Text(FlutterI18n.translate(context, title ?? ''), style: const TextStyle(fontSize: 18))
    );
  }
}
