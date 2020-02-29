import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class AnimalPage extends StatelessWidget {
  AnimalPage({
    @required this.url
  });

  final String url;

  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(24.0)),
        boxShadow: [
          BoxShadow(
            blurRadius: 20.0,
            color: Colors.grey,
          ),
        ]
      ),
      margin: const EdgeInsets.all(24.0),
      child: CachedNetworkImage(
        imageUrl: url,
      )
    );
  }
}