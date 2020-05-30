import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:shelters/index.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({
    this.title
  });

  final String title;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>{
  final List<String> _animals = ['All','Cats','Dogs','Birds'];

  @override
  Widget build(BuildContext context) {
    return SheltersScaffold(
      appBar: SheltersAppBar(
        title: widget.title ?? '',
        trailing: GestureDetector(
          child: Icon(MdiIcons.tune, color: Colors.grey[600],),
          onTap: (){},
        ),
      ),
      bodyList: [
        _shortPets(),
        Column(
          children: List.generate(3, (index){
            return AnimalMiniCard(
              tag: 'tag_${widget.title}_$index'
            );
          })
        )
      ]
    );    
  }

  Widget _shortPets(){
    return Container(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _animals.length,
        padding: EdgeInsets.symmetric(horizontal: 4),
        itemBuilder: (context, index) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(12),
                child: SheltersButton(
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
              ),
              Text(FlutterI18n.translate(context, _animals[index]))
            ],
          );
        },
      ),
    );
  }
}