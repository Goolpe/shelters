// import 'package:flutter/material.dart';
// import 'package:flutter_swiper/flutter_swiper.dart';
// import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

// class SheltersAnimalImage extends StatelessWidget {
//   SheltersAnimalImage({
//     @required this.id
//   });

//   final int id;

//   @override
//   Widget build(BuildContext context) {
//     final bool _orientationPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

//     return Container(
//       height: MediaQuery.of(context).size.height / 1.5,
//       width: MediaQuery.of(context).size.width,
//       child: Stack(
//         children: [
//           _orientationPortrait
//           ? Swiper(
//             key: Key('$id'),
//             containerHeight: 400,
//             itemHeight: 400,
//             itemBuilder: (BuildContext context,int index){
//               return _image(index, context);
//             },
//             itemCount: 3,
//             pagination: SwiperPagination(),
//           )
//           : Container(
//             height: 400,
//             child: ListView.builder(
//               itemCount: 3,
//               scrollDirection: Axis.horizontal,
//               itemBuilder: (context, index) {
//                 return _image(index, context);
//               },
//             ),
//           ),
//           Positioned(
//             left: 16,
//             right: 16,
//             bottom: 24,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 RichText(
//                   text: TextSpan(
//                     style: TextStyle(
//                       fontSize: 18.0,
//                       color: Colors.white,
//                     ),
//                     children: <TextSpan>[
//                       TextSpan(text: 'Pushok | ', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
//                       TextSpan(text: '5 months'),
//                     ],
//                   ),
//                 ),
//                 IconButton(
//                   iconSize: 30,
//                   icon: Icon(MdiIcons.heartOutline, color: Colors.pink[500]),
//                   onPressed: (){},
//                 )
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }

//   Widget _image(int index, BuildContext context){
//     return Stack(
//       children: [
//         SizedBox(
//           height: MediaQuery.of(context).size.height,
//           child: Image.network(
//             'https://images.unsplash.com/photo-1552933529-e359b2477252?ixlib=rb-1.2.1&w=1000&q=80',
//             fit: BoxFit.cover
//           ),
//         ),
//         Container(
//           decoration: BoxDecoration(
//             gradient: LinearGradient(
//               begin: Alignment.topCenter,
//               end: Alignment.bottomCenter,
//               colors: [
//                 Colors.transparent,
//                 Colors.black45,
//               ]
//             ),
//           ),
//         )
//       ],
//     );
//   }
// }