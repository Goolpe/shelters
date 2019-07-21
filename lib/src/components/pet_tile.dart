import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'package:shelters/shelf.dart';

class PetTileSh extends StatelessWidget {
  const PetTileSh({
    Key key, 
    this.onTap,
    this.text = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vitae viverra purus, non iaculis neque. ',
  }) : super(key:key);

  final String text;
  final Function onTap;
  
  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: InkWell(
        child: Row(
          children: <Widget>[
            Container(
              height: 110,
              width: 80,
              child: CachedNetworkImage(
                imageUrl: URL,
                fit: BoxFit.cover,
              )
            ),
            Flexible(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('Джими'),
                        Text('5 месяцев'),
                      ],
                    ),
                    Divider(),
                    Row(
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.only(right: 10),
                          child: Icon(MdiIcons.paw)
                        ),
                        const Text('Собака'),
                        const Text(' | Йоркширский терьер')
                      ],
                    ),
                    Container(
                      height: 10
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.only(right: 10),
                          child: Icon(MdiIcons.mapMarker),
                        ),
                        const Text('Санкт-Петербург')
                      ],
                    ),
                  ]
                )
              )
            )
          ],
        ),   
        onTap: onTap
      )
    );
  }
}
