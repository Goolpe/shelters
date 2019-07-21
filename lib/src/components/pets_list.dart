import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import 'package:shelters/shelf.dart';

class PetsListSh extends StatefulWidget {
  const PetsListSh({
    Key key,
    @required this.title
  }) : super(key:key);

  final String title;

  @override
  _PetsListShState createState() => _PetsListShState();
}

class _PetsListShState extends State<PetsListSh> {
  final PanelController _pc = PanelController();
  final SearchBloc _searchBloc = SearchBloc();

  //values for dropdown for type of animal
  List<String> types = <String>['Все', 'Собаки', 'Кошки', 'Птицы', 'Рыбы', 'Грызуны', 'Остальные'];
  String _typeValue = 'Все';

  //values for age slider
  RangeValues _values = RangeValues(0,1);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SearchBloc>(
      builder: (BuildContext context) => SearchBloc(),
      child: BlocBuilder<SearchEvent, bool>(
        bloc: _searchBloc,
        builder: (BuildContext context, bool stateSearch) {
          return SlidingUpPanel(
            onPanelOpened: () => _searchBloc.dispatch(SearchEvent.show),
            onPanelClosed: () => _searchBloc.dispatch(SearchEvent.hide),
            backdropEnabled: true,
            minHeight: 0,
            maxHeight: 180,
            controller: _pc,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15), 
              topRight: Radius.circular(15)
            ),
            panel: Scaffold(
              body: _filter()
            ),
            body: Scaffold(
              appBar: CustomAppBarSh(
                title: widget.title,
                actions: <Widget>[
                  Container(
                    width: 50,
                    child: InkWell(
                      child: Icon(MdiIcons.plus),
                      onTap: (){}
                    )
                  ),
                  const VerticalDivider(
                    width: 0 
                  ),
                  Container(
                    width: 50,
                    child: InkWell(
                      child: Icon(MdiIcons.filterOutline),
                      onTap: () => _pc.open()
                    )
                  )
                ],
              ),
              body: _petList()
            ),
          );
        }
      )
    );
  }

  Widget _petList(){
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (BuildContext context, int i) {
        return PetTileSh(
          onTap: () => Navigator.pushNamed(context, '/pet_card')
        );
      }
    );
  }

  Widget _filter(){
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      color: Theme.of(context).scaffoldBackgroundColor,
      child: ListView(
        children: <Widget>[
          FilterTileSh(
            label: 'Вид:',
            secondPart: _typeDown(),
          ),
          FilterTileSh(
            label: 'Возраст:',
            secondPart: Row(
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  width: 30,
                  child: Text('${_values.start}')
                ),
                RangeSlider(
                  min: 0,
                  max: 20,
                  divisions: 40,
                  labels: RangeLabels('${_values.start}', '${_values.end}'),
                  onChanged: (RangeValues val){
                    setState(() {
                      _values = val;
                    });
                  },
                  values: _values
                ),
                Container(
                  alignment: Alignment.center,
                  width: 30,
                  child: Text('${_values.end}')
                ),
              ],
            )
          ),
        ],
      )
    );
  }

  Widget _typeDown(){
    return DropdownButton<String>(
      items: types.map((String val) =>
        DropdownMenuItem<String>(
          value: val,
          child: Text(
            val,
          ),
        )
      ).toList(),
      value: _typeValue,
      onChanged: (String value) {
        setState(() {
          _typeValue = value; 
        });
      },
    );
  }
}