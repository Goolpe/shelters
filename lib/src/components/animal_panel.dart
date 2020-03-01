import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shelters/shelf.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class AnimalPanel extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Consumer<AnimalPanelModel>(
      builder: (context, state, _){
        return SlidingUpPanel(
          renderPanelSheet: false,
          maxHeight: MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top,
          minHeight: 0,
          panelBuilder: (ScrollController sc) => 
            state.url.isEmpty 
            ? SizedBox() 
            : _animalPage(state.url, sc),
          controller: state.controller,
        );
      }
    );
  }

  Widget _animalPage(String url, ScrollController scrollController){
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
              containerHeight: 400,
              itemHeight: 400,
              itemBuilder: (BuildContext context,int index){
                return CachedNetworkImage(imageUrl: url, fit: BoxFit.cover);
              },
              itemCount: 3,
              pagination: SwiperPagination(),
            ),
          ),
          ListTile(
            title: Text('Лола, 2'),
            subtitle: Text('Чеширский кот'),
            trailing: Chip(
              label: Text('кошки', style: TextStyle(color: Colors.white)),
              backgroundColor: Colors.green
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