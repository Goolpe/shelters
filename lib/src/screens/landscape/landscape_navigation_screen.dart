// import 'package:flutter/material.dart';
// import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
// import 'package:provider/provider.dart';
// import 'package:shelters/index.dart';

// class LandscapeNavigationScreen extends StatelessWidget {

//   @override
//   Widget build(BuildContext context) {
//     return Align(
//       alignment: Alignment.center,
//       child: ConstrainedBox(
//         constraints: BoxConstraints(maxWidth: 1200),
//         child: Consumer<NavigationProvider>(
//           builder: (context, navState, snapshot) {
//             return Row(
//               mainAxisSize: MainAxisSize.max,
//               children: [
//                 Expanded(
//                   flex: 1,
//                   child: Column(
//                     children: [
//                       AppBar(
//                         centerTitle: true,
//                         elevation: 0,
//                         title: Text('Shelters', style: TextStyle(color: Colors.black)),
//                         backgroundColor: Colors.transparent,
//                       ),
//                       SheltersNavButton(
//                         icon: MdiIcons.paw,
//                         label: 'Discover',
//                         index: 0,
//                       ),
//                       SheltersNavButton(
//                         icon: MdiIcons.paw,
//                         label: 'Animals',
//                         index: 1,
//                       ),
//                       SheltersNavButton(
//                         icon: MdiIcons.magnify,
//                         label: 'Lost',
//                         index: 2,
//                       ),
//                       SheltersNavButton(
//                         icon: MdiIcons.accountCog,
//                         label: 'Settings',
//                         index: 3,
//                       )
//                     ],
//                   ),
//                 ),
//                 Expanded(
//                   flex: 5,
//                   child: navState.screen
//                   )
//                 ]
//             );
//           }
//         )
//       )
//     );
//   }
// }