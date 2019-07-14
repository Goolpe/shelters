import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'package:shelters/shelf.dart';

class PetCardSh extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarSh(title: 'Карточка питомца'),
      body: ListView(
        children: <Widget>[
          Container(
            height: 150,
            width: MediaQuery.of(context).size.width * 2,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 3,
              itemBuilder: (BuildContext context, int i) {
                return Card(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                  child: Container(
                    height: 150,
                    width: 150,
                    child: InkWell(
                      child: CachedNetworkImage(
                          imageUrl: URL,
                          fit: BoxFit.cover,
                        ),
                        onTap: () => Navigator.push<dynamic>(
                          context, MaterialPageRoute<dynamic>(
                            builder: (BuildContext context) => PhotoGallerySh(
                              index: i,
                              itemCount: 3,
                            )
                          )
                        ),
                      ),
                  ),
                );
              },
            ),
          ),
          Card(
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const <Widget>[
                  RichTextTileSh(
                    firstText: 'Кличка: ',
                    secondText: 'Клеопатра',
                  ),
                  RichTextTileSh(
                    firstText: 'Тип: ',
                    secondText: 'Собака',
                  ),
                  RichTextTileSh(
                    firstText: 'Порода: ',
                    secondText: 'Терьер',
                  ),
                  RichTextTileSh(
                    firstText: 'Пол: ',
                    secondText: 'мужской',
                  ),
                  RichTextTileSh(
                    firstText: 'Цвет: ',
                    secondText: 'черный',
                  ),
                  RichTextTileSh(
                    firstText: 'Дополнительно: ',
                    secondText: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vitae viverra purus',
                  )
                ],
              )
            ),
          ),
          Card(
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    child: Row(
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.only(right: 10),
                          child: Icon(MdiIcons.mapMarker),
                        ),
                        const Text('Санкт-Петербург')
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    child: Row(
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.only(right: 10),
                          child: Icon(MdiIcons.cellphoneIphone),
                        ),
                        const Text('+7 (999) 999-99-99')
                      ],
                    ),
                  )
                ]
              )
            )
          )
        ]
      )
    );
  }
}
