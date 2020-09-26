import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';

import 'package:shelters/index.dart';

class AnimalMiniCard extends StatelessWidget {
  const AnimalMiniCard({
    @required this.tag,
    @required this.data,
  }) : assert(tag != null);

  final String tag;
  final Animal data;

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      child: Column(
        children: [
          Container(
            height: 120,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(16)),
              color: Colors.white,
              image: data.images != null && data.images.isNotEmpty
              ? DecorationImage(
                fit: BoxFit.cover,
                image: CachedNetworkImageProvider(data.images[0])
              )
              : const SizedBox.shrink()
            ),
          ),
          const SizedBox(height: 8),
          Text(data.name)
        ],
      ),
      onTap: () => Navigator.push(context, 
        MaterialPageRoute(builder: (context) =>
          AnimalScreen(
            tag: tag,
            data: data,
          )
        )
      ),
    );
  }
}
