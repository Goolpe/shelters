import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shelters/index.dart';

class AnimalMiniCard extends StatelessWidget {
  const AnimalMiniCard({
    this.tag,
    @required this.data,
  }) : assert(tag != null);

  final String tag;
  final Animal data;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      child: GestureDetector(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Hero(
                tag: tag,
                child: Container(
                  height: 120,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(16)),
                    color: Colors.white,
                    image: data.images != null && data.images.isNotEmpty
                    ? DecorationImage(
                      fit: BoxFit.cover,
                      image: CachedNetworkImageProvider(data.images[0])
                    )
                    : SizedBox()
                  ),
                ),
              ),
            ),
            Text(data.name)
          ],
        ),
        onTap: () => Get.to<Widget>(
          AnimalScreen(
            tag: tag,
            data: data,
          )
        ),
      ),
    );
  }
}