import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shelters/index.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>{
  final List<String> _animals = ['all','cats','dogs','birds'];

  @override
  Widget build(BuildContext context) {
    return SheltersScaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Column(
          children: [
            SheltersHeader(
              title: 'Adoption',
              trailing: GestureDetector(
                child: Icon(MdiIcons.tune, color: Colors.grey[600],),
                onTap: (){},
              ),
            ),
            Expanded(
              child: Container(
                color: Color(0xfff6f6f6),
                child: ListView(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  shrinkWrap: true,
                  children: [
                    _shortPets(),
                    Column(
                      children: List.generate(3, (index){
                        return AnimalMiniCard(
                          index: index
                        );
                      })
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      )
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
                  color: index == 0 ? Color(0xff306060) : Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.4),
                      spreadRadius: 1,
                      blurRadius: 15,
                      offset: Offset(0, 10), // changes position of shadow
                    ),
                  ]
                ),
                margin: EdgeInsets.all(12),
                padding: EdgeInsets.all(16),
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