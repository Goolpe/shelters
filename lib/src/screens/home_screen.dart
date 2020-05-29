import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:shelters/index.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({
    this.title = ''
  });

  final String title;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>{
  final List<String> _animals = ['all','cats','dogs','birds'];

  @override
  Widget build(BuildContext context) {
    return SheltersScaffold(
      appBar: SheltersAppBar(
        title: widget.title,
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
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                  color: index == 0 ? Theme.of(context).accentColor : Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(16)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.4),
                      spreadRadius: 1,
                      blurRadius: 15,
                      offset: Offset(0, 10), // changes position of shadow
                    ),
                  ]
                ),
                margin: const EdgeInsets.all(12),
                padding: const EdgeInsets.all(16),
                child: SvgPicture.asset(
                  'assets/${_animals[index]}.svg',
                  color: index == 0 ? Colors.white : Colors.black,
                ),
              ),
              Text(_animals[index])
            ],
          );
        },
      ),
    );
  }
}