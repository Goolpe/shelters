import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:shelters/index.dart';

class AnimalMiniCard extends StatelessWidget {
  AnimalMiniCard({
    this.index
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 16),
      child: GestureDetector(
        child: Stack(
          children: [
            Container(
              height: 200,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 30,
                    offset: Offset(0, 25),
                  ),
                ]
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.white,
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: SizedBox()
                    ),
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Petrushka', style: Theme.of(context).textTheme.headline5,),
                                Icon(MdiIcons.genderMale, color: Color(0xffb0b0b0)),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: Text('Abyssinian cat'),
                            ),
                            Text('2 years old', style: TextStyle(color: Colors.grey[500]),),
                            Padding(
                              padding: const EdgeInsets.only(top: 8),
                              child: Row(
                                children: [
                                  Icon(MdiIcons.mapMarker, size: 18),
                                  SizedBox(width: 5),
                                  AutoSizeText('Distance: 3.6 km', style: TextStyle(fontSize: 16, color: Colors.grey[700]),),
                                ],
                              )
                            )
                          ],
                        ),
                      )
                    )
                  ],
                )
              ),
            ),
            Positioned(
              left: 16,
              child: Container(
                height: 200,
                width: MediaQuery.of(context).size.width / 2 - 20,
                child: Hero(
                  tag: 'animal_image_$index',
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 3,
                          blurRadius: 12,
                          offset: Offset(10, 0),
                        ),
                      ],
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: CachedNetworkImageProvider('https://news.cgtn.com/news/77416a4e3145544d326b544d354d444d3355444f31457a6333566d54/img/37d598e5a04344da81c76621ba273915/37d598e5a04344da81c76621ba273915.jpg')
                      )
                    ),
                  ),
                )
              ),
            )
          ],
        ),
        onTap: () => Get.to(AnimalScreen(index: index)),
      ),
    );
  }
}