import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shelters/index.dart';

class SheltersAnimalImage extends StatelessWidget {
  SheltersAnimalImage({
    @required this.tag,
    this.isBig = false
  });

  final String tag;
  final bool isBig;
  
  @override
  Widget build(BuildContext context) {
    return Consumer<CarouselProvider>(
      builder: (context, carouselState, snapshot) {
        return Stack(
          alignment: Alignment.topCenter,
          children: [
            Hero(
              tag: tag,
              child: Container(
                height: isBig ? MediaQuery.of(context).size.height : 400,
                alignment: Alignment.topCenter,
                child: CarouselSlider(
                  options: CarouselOptions(
                    viewportFraction: 1,
                    initialPage: carouselState.index,
                    height: MediaQuery.of(context).size.height,
                    onPageChanged: (int i, CarouselPageChangedReason _){
                      Provider.of<CarouselProvider>(context, listen: false).changeIndex(i);
                    }
                  ),
                  carouselController: carouselState.carouselController,
                  items: carouselState.images.map((i) {
                    return GestureDetector(
                      child: Stack(
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height,
                            child: CachedNetworkImage(
                              imageUrl: i,
                              fit: BoxFit.cover
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                                colors: [
                                  Colors.transparent,
                                  Colors.black45,
                                ]
                              ),
                            ),
                          )
                        ],
                      ),
                      onTap: () => isBig
                      ? null
                      : Get.to(
                        Scaffold(body: SheltersAnimalImage(tag: tag, isBig: true))
                      ),
                    );
                  }).toList(),
                )
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
                      icon: Icon(isBig ? MdiIcons.close : MdiIcons.chevronLeft, size: 30, color: Colors.white,),
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
            Positioned(
              bottom: 10,
              child: Container(
                height: 8,
                margin: const EdgeInsets.only(bottom: 6),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(carouselState.images.length, (index){
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 2),
                      child: CircleAvatar(
                        radius: 4,
                        backgroundColor: index == carouselState.index 
                        ? Colors.blue : Colors.grey[300],
                      ),
                    );
                  }),
                )
              ),
            )
          ],
        );
      }
    );
  }
}