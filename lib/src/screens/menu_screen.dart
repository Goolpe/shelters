import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shelters/index.dart';

class MenuScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {    
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: Consumer<SettingsProvider>(
          builder: (context, settingsState, snapshot) {
            return Consumer<NavigationProvider>(
              builder: (context, navState, snapshot) {
                return SafeArea(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              child: Container(
                                color: Colors.transparent,
                                margin: EdgeInsets.only(right: 120),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(right: 16),
                                      child: CircleAvatar(
                                        radius: 24,
                                        backgroundColor: Theme.of(context).accentColor,
                                        child: Icon(MdiIcons.camera, size: 24, color: Colors.white)
                                      )
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('Arthur Khabirov', style: Theme.of(context).textTheme.headline6.copyWith(color: Colors.white)),
                                        SizedBox(height: 5),
                                        Text('Active status', style: TextStyle(color: Color(0xff83b1af)),)
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              onTap: () =>
                                Provider.of<NavigationProvider>(context, listen: false).openScreen('Profile'),
                            ),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  MenuItem(
                                    icon: MdiIcons.paw,
                                    title: 'Pets',
                                  ),
                                  MenuItem(
                                    icon: MdiIcons.plus,
                                    title: 'Add pet',
                                  ),
                                  MenuItem(
                                    icon: MdiIcons.heart,
                                    title: 'Favorites',
                                  ),
                                  MenuItem(
                                    icon: MdiIcons.forum,
                                    title: 'Messages',
                                  ),
                                  MenuItem(
                                    icon: MdiIcons.handshake,
                                    title: 'Donation',
                                  ),
                                ]
                              ),
                            ),
                            Row(
                              children: [
                                MenuItem(
                                  icon: MdiIcons.cog,
                                  title: 'Settings'
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 16),
                                  child: Text('|', style: TextStyle(color: Color(0xff83b1af)),),
                                ),
                                MenuItem(
                                  title: 'Log out'
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Positioned(
                        right: -(MediaQuery.of(context).size.width / 1.6),
                        child: _child(
                          tag: navState.prevTitle,
                          widget: navState.screenWidget(navState.prevTitle),
                          context: context,
                          height: 1.4,
                          overlay: true
                        )
                      ),
                      Positioned(
                        right: -(MediaQuery.of(context).size.width / 1.4),
                        child: _child(
                          tag: navState.activeTitle,
                          widget: navState.screenWidget(navState.activeTitle),
                          context: context,
                          height: 1.2,
                        )
                      ),
                    ],
                  ),
                );
              }
            );
          }
        )
      )
    );
  }

  Widget _child({
    @required String tag,
    @required Widget widget,
    @required BuildContext context,
    @required double height,
    bool overlay = false
  }){
    return Stack(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height / height,
          width: MediaQuery.of(context).size.width,
          child: Hero(
            tag: tag,
            child: IgnorePointer(
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(24)),
                child: widget
              )
            )
          )
        ),
        if(overlay)
          Positioned.fill(
            child: Container(
              color: Theme.of(context).primaryColor.withOpacity(0.6),
            ),
          )
      ],
    );
  }
}