import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shelters/shelf.dart';

class Avatar extends StatelessWidget{
  Avatar({
    @required this.url,
    @required this.title
  });

  final String url;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: InkWell(
            customBorder: CircleBorder(),
            child: Padding(
            padding: EdgeInsets.all(10),
            child: url.isEmpty
              ? CircleAvatar(
                radius: MediaQuery.of(context).size.width/8,
                backgroundColor: Colors.grey[200],
              )
              : CircleAvatar(
                radius: MediaQuery.of(context).size.width/8,
                backgroundImage: CachedNetworkImageProvider(url),
                backgroundColor: Colors.grey[200],
              ),
            ),
            onTap: () => BlocProvider.of<SlidingPanelBloc>(context).add(SlidingPanelOpened(url: url)),
          ),
        ),
        Text(title)
      ]
    );
  }
}