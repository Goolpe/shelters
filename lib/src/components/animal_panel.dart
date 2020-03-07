import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shelters/shelf.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:timeago/timeago.dart' as timeago;

class AnimalPanel extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Consumer<AnimalPanelModel>(
      builder: (context, AnimalPanelModel state, _){
        return SlidingUpPanel(
          renderPanelSheet: false,
          maxHeight: MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top,
          minHeight: 0,
          panelBuilder: (ScrollController sc) => 
            state.animal == null
            ? SizedBox() 
            : _animalPage(state.animal, sc),
          controller: state.controller,
        );
      }
    );
  }

  Widget _animalPage(AnimalModel animal, ScrollController scrollController){
    return Card(
      elevation: 20,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      margin: const EdgeInsets.all(24.0),
      child: ListView(
        padding: EdgeInsets.all(0),
        controller: scrollController,
        children:<Widget>[
          SizedBox(
            height: 400,
            child: Swiper(
              key: Key(animal.id),
              containerHeight: 400,
              itemHeight: 400,
              itemBuilder: (BuildContext context,int index){
                return CachedNetworkImage(imageUrl: animal.images[index], fit: BoxFit.cover);
              },
              itemCount: animal.images.length,
              pagination: SwiperPagination(),
            ),
          ),
          ListTile(
            title: Text('${animal.name}, ${timeago.format(DateTime.parse(animal.dateOfBirth))}'),
            subtitle: Text('${animal.breed}'),
            trailing: Chip(
              label: Text('${animal.type.name}', style: TextStyle(color: Colors.white)),
              backgroundColor: animal.type.color
            ),
          ),
          ListTile(
            title: Text('Местоположение'),
            subtitle: Text('Санкт-Петербург, приют №1'),
            trailing: Icon(MdiIcons.mapMarker),
            onTap: (){},
          ),
        ]
      )
    );
  }
}