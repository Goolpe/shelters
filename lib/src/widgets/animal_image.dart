import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class SheltersAnimalImage extends StatelessWidget {
  SheltersAnimalImage({
    @required this.id
  });

  final int id;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: Swiper(
        key: Key('$id'),
        containerHeight: 400,
        itemHeight: 400,
        itemBuilder: (BuildContext context,int index){
          return Image.network(
            'https://images.unsplash.com/photo-1552933529-e359b2477252?ixlib=rb-1.2.1&w=1000&q=80',
            fit: BoxFit.cover
          );
        },
        itemCount: 3,
        pagination: SwiperPagination(),
      ),
    );
  }
}