// import 'package:flutter/material.dart';
// import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
// import 'package:provider/provider.dart';
// import 'package:shelters/index.dart';
// import 'package:sliding_up_panel/sliding_up_panel.dart';

// class PortraitNavigationScreen extends StatelessWidget {

//   @override
//   Widget build(BuildContext context) {

//     return Consumer<PanelProvider>(
//       builder: (context, panelState, snapshot) {
//         return SlidingUpPanel(
//           minHeight: 0,
//           maxHeight: MediaQuery.of(context).size.height - 20,
//           backdropEnabled: true,
//           renderPanelSheet: false,
//           controller: panelState.panelController,
//           panelBuilder: (ScrollController sc) => 
//             PortraitAnimalScreen(
//               id: panelState.id, 
//               scrollController: sc
//             ),
//           body: Consumer<NavigationProvider>(
//             builder: (context, navState, snapshot) {
//               return Scaffold(
//                 appBar: AppBar(
//                   centerTitle: true,
//                   elevation: 0,
//                   title: Text('Shelters', style: TextStyle(color: Colors.black)),
//                   backgroundColor: Colors.transparent,
//                 ),
//                 body: navState.screen,
//                 bottomNavigationBar: BottomNavigationBar(
//                   type: BottomNavigationBarType.fixed,
//                   currentIndex: navState.index,
//                   onTap: (int index) {
//                     Provider.of<NavigationProvider>(context, listen: false).openScreen(index);
//                   },
//                   showSelectedLabels: false,
//                   showUnselectedLabels: false,
//                   items: [
//                     BottomNavigationBarItem(
//                       icon: Icon(MdiIcons.paw),
//                       title: Text('')
//                     ),
//                     BottomNavigationBarItem(
//                       icon: Icon(MdiIcons.alert),
//                       activeIcon: Icon(MdiIcons.alert, color: Colors.red),
//                       title: Text('')
//                     ),
//                     BottomNavigationBarItem(
//                       icon: Icon(MdiIcons.accountCog),
//                       activeIcon: Icon(MdiIcons.accountCog, color: Colors.orange),
//                       title: Text('')
//                     ),
//                   ]
//                 )
//               );
//             }
//           )
//         );
//       }
//     );
//   }
// }