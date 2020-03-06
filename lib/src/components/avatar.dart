import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shelters/shelf.dart';

class Avatar extends StatelessWidget{
  Avatar({
    @required this.animal
  });

  final AnimalModel animal;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: InkWell(
            customBorder: CircleBorder(),
            child: Padding(
            padding: EdgeInsets.all(10),
            child: animal == null
              ? CircleAvatar(
                radius: MediaQuery.of(context).size.width/8,
                backgroundColor: Colors.grey[200],
              )
              : CircleAvatar(
                radius: MediaQuery.of(context).size.width/8,
                backgroundImage: CachedNetworkImageProvider(animal.images[0]),
                backgroundColor: Colors.grey[200],
              ),
            ),
            onTap: () => Provider.of<AnimalPanelModel>(context, listen: false).open(animal)
          ),
        ),
        Text(animal != null ? animal.name : '')
      ]
    );
  }
}