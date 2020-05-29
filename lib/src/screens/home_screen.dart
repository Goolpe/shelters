import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
        ),
        padding: const EdgeInsets.only(top: 15),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: GestureDetector(
                      child: SvgPicture.asset(
                        'assets/menu.svg',
                        color: Colors.grey[600],
                        height: 25,
                      ),
                      onTap: () => Navigator.pop(context),
                    ),
                  ),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 5),
                          child: Text('Location', style: TextStyle(color: Colors.grey,),),
                        ),
                        Row(
                          children: [
                            Icon(MdiIcons.mapMarker, size: 18),
                            SizedBox(width: 5),
                            AutoSizeText('Saint-Petersburg, Russia', style: TextStyle(fontSize: 18),),
                          ],
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: GestureDetector(
                      child: Icon(MdiIcons.tune, color: Colors.grey[600],),
                      onTap: (){},
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(  
                  color: Color(0xfff6f6f6),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: ListView(
                  shrinkWrap: true,
                  children: [

                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
    // final bool _orientationPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

    // return Scaffold(
    //   body: Consumer<PanelProvider>(
    //     builder: (context, panelState, snapshot) {
    //       return _orientationPortrait
    //       ? PortraitNavigationScreen()
    //       : LandscapeNavigationScreen();
    //     }
    //   )
    // );
  }
}