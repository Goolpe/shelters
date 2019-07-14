import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'package:shelters/shelf.dart';

class PetTileSh extends StatelessWidget {
  const PetTileSh({
    Key key, 
    this.text = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vitae viverra purus, non iaculis neque. ',
  }) : super(key:key);

  final String text;
  
  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        child: Container(
          margin: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(right: 15, bottom: 10),
                    height: 100,
                    width: 80,
                    child: CachedNetworkImage(
                      imageUrl: URL,
                      fit: BoxFit.cover,
                    )
                  ),
                  Flexible(
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                            Text('Джими'),
                            Divider(),
                            Row(
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(right: 10),
                                  child: Icon(MdiIcons.paw)
                                ),
                                Text('Собака'),
                                Text(' | Йоркширский терьер')
                              ],
                            ),
                            Container(
                              height: 10
                            ),
                            Row(
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(right: 10),
                                  child: Icon(MdiIcons.mapMarker),
                                ),
                                Text('Санкт-Петербург')
                              ],
                            ),
                        ]
                      )
                    )
                  )
                ],
              ),
              Text(text,
                overflow: TextOverflow.ellipsis,
                maxLines: 5,
              ),
            ]
          )
        ),   
      onTap: () => Navigator.pushNamed(context, '/pet_card')
      )
    );
  }
}
