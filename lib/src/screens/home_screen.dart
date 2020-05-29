import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shelters/index.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>{
  final List<String> _animals = ['all','cats','dogs','birds'];

  @override
  Widget build(BuildContext context) {
    return Consumer<NavigationProvider>(
      builder: (context, navState, snapshot) {
        return Scaffold(
          backgroundColor: Colors.transparent,
          body: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: navState.isMenu 
              ? BorderRadius.circular(24) 
              : BorderRadius.zero,
            ),
            padding: const EdgeInsets.only(top: 15),
            child: Column(
              children: [
                _header(),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(  
                      color: Color(0xfff6f6f6),
                      borderRadius: navState.isMenu 
                      ? BorderRadius.circular(24) 
                      : BorderRadius.zero,
                    ),
                    child: ClipRRect(
                      borderRadius: navState.isMenu 
                      ? BorderRadius.circular(24) 
                      : BorderRadius.zero,
                      child: ListView(
                        padding: EdgeInsets.symmetric(vertical: 8),
                        shrinkWrap: true,
                        children: [
                          _shortPets(),
                          Column(
                            children: List.generate(3, (index){
                              return AnimalMiniCard();
                            })
                          )
                        ],
                      ),
                    ),
                  )
                )
              ],
            ),
          ),
        );
      }
    );    
  }

  Widget _header(){
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: GestureDetector(
              child: SvgPicture.asset(
                'assets/menu.svg',
                color: Colors.grey[600],
                height: 25,
              ),
              onTap: () => Provider.of<NavigationProvider>(context, listen: false).openScreen('Menu'),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: Text('Location', style: TextStyle(color: Colors.grey,),),
                ),
                Row(
                  children: [
                    Icon(MdiIcons.mapMarker, size: 18),
                    SizedBox(width: 5),
                    AutoSizeText('Saint-Petersburg, Russia', style: TextStyle(fontSize: 18),),
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: GestureDetector(
              child: Icon(MdiIcons.tune, color: Colors.grey[600],),
              onTap: (){},
            ),
          )
        ],
      ),
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