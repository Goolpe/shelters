// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:shelters/index.dart';

// class SheltersNavButton extends StatelessWidget {
//   SheltersNavButton({
//     @required this.icon,
//     @required this.label,
//     @required this.index
//   }) : assert(
//     icon != null && 
//     label != null && 
//     index != null
//   );

//   final IconData icon;
//   final String label;
//   final int index;

//   @override
//   Widget build(BuildContext context) {

//     return Consumer<NavigationProvider>(
//       builder: (context, navState, snapshot) {
//         return FlatButton(
//           hoverColor: Colors.transparent,
//           splashColor: Colors.transparent,
//           highlightColor: Colors.transparent,
//           textColor: navState.index == index ? Colors.blue : Colors.black,
//           child: Align(
//             alignment: Alignment.centerLeft,
//             child: Row(
//               children: [
//                 Icon(icon),
//                 Padding(
//                   padding: const EdgeInsets.only(left: 8),
//                   child: Text(label),
//                 ),
//               ],
//             ),
//           ),
//           onPressed: () => 
//             Provider.of<NavigationProvider>(context, listen: false).openScreen(index)
//         );
//       }
//     );
//   }
// }