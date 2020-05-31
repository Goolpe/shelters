import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shelters/index.dart';

class SheltersAnimalImage extends StatelessWidget {
  SheltersAnimalImage({
    @required this.tag,
  }) : assert(tag != null);

  final String tag;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      margin: EdgeInsets.only(bottom: 70),
      child: Consumer<CarouselProvider>(
        builder: (context, carouselState, snapshot) {
          return Stack(
            alignment: Alignment.topCenter,
            children: [
              Hero(
                tag: tag,
                child: Container(
                  height: 400,
                  child: ExtendedImageGesturePageView.builder(
                    itemBuilder: (BuildContext context, int index) {
                      return ExtendedImage.network(
                        carouselState.images[index],
                        fit: BoxFit.cover,
                        enableSlideOutPage: true,
                        mode: ExtendedImageMode.gesture,
                      );
                    },
                    itemCount: carouselState.images.length,
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
              Positioned.fill(
                top: 40,
                child: ShowUp(
                  delay: 100,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: Icon(MdiIcons.chevronLeft, size: 30, color: Colors.white,),
                        onPressed: () => Get.back(),
                      ),
                      IconButton(
                        icon: Icon(MdiIcons.share, size: 30, color: Colors.white),
                        onPressed: () => Get.back(),
                      )
                    ],
                  )
                ),
              ),
            ],
          );
        }
      ),
    );
  }
}