import 'package:flutter/material.dart';

import 'package:extended_image/extended_image.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';

import 'package:shelters/index.dart';

class SheltersAnimalImage extends StatelessWidget {
  const SheltersAnimalImage({
    @required this.tag,
    @required this.images
  }) : assert(tag != null);

  final String tag;
  final List<dynamic> images;

  @override
  Widget build(BuildContext context) {
    return Consumer<CarouselProvider>(
      builder: (context, carouselState, snapshot) {
        return Stack(
          children: [
            Hero(
              tag: tag,
              child: Container(
                height: 400,
                width: MediaQuery.of(context).size.width,
                child: ExtendedImageGesturePageView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    return ExtendedImage.network(
                      images[index],
                      fit: BoxFit.cover,
                      color: Colors.black.withOpacity(0.2),
                      colorBlendMode: BlendMode.srcOver,
                    );
                  },
                  itemCount: images.length,
                  onPageChanged: (int index) {
                    Provider.of<CarouselProvider>(context, listen: false).changeIndex(index);
                  },
                  controller: PageController(
                    initialPage: 0,
                  ),
                  scrollDirection: Axis.horizontal,
                ),
              )
            ),
            Positioned(
              bottom: 8,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(images.length, (index){
                  return Padding(
                    padding: const EdgeInsets.all(2),
                    child: CircleAvatar(
                      radius: 4,
                      backgroundColor: index == carouselState.index
                      ? Colors.blue : Colors.grey[300],
                    ),
                  );
                }),
              ),
            ),
            Positioned(
              top: 40,
              left: 0,
              right: 0,
              child: ShowUp(
                delay: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: const Icon(MdiIcons.chevronLeft, size: 40, color: Colors.white,),
                      onPressed: () => Navigator.pop(context),
                    ),
                    IconButton(
                      icon: const Icon(MdiIcons.shareVariant, size: 30, color: Colors.white),
                      onPressed: () => Share.share('check my github https://github.com/Goolpe'),
                    )
                  ],
                )
              ),
            ),
          ],
        );
      }
    );
  }
}
