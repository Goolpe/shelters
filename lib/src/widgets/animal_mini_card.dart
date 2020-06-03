import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:shelters/index.dart';
import 'package:timeago/timeago.dart' as timeago;

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
        child: Stack(
          alignment: Alignment.centerLeft,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(16)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 30,
                    offset: const Offset(0, 25),
                  ),
                ]
              ),
              child: Container(
                padding: EdgeInsets.all(16),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                  color: Colors.white,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Expanded(
                      flex: 1,
                      child: SizedBox()
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _cardItem(data.name ?? '', style: TextStyle(fontSize: 24)),
                              Icon(data.gender == 'Male' 
                                ? MdiIcons.genderMale 
                                : MdiIcons.genderFemale, 
                                color: Color(0xffb0b0b0)
                              ),
                              ],
                          ),
                          _cardItem(timeago.format(data.age)),
                          _cardItem(data.breed ?? ''),
                        ],
                      )
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              child: Container(
                height: 200,
                width: MediaQuery.of(context).size.width / 2 - 20,
                child: Hero(
                  tag: tag,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(16)),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 3,
                          blurRadius: 12,
                          offset: const Offset(10, 0),
                        ),
                      ],
                      image: data.images != null && data.images.isNotEmpty
                      ? DecorationImage(
                        fit: BoxFit.cover,
                        image: CachedNetworkImageProvider(data.images[0])
                      )
                      : SizedBox()
                    ),
                  ),
                )
              ),
            )
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

  Widget _cardItem(String label, {TextStyle style}){
    return Padding(
      padding: EdgeInsets.all(8),
      child: Text(label, style: style),
    );
  }
}