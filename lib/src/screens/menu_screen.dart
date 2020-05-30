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
        backgroundColor:  Theme.of(context).primaryColor,
        body: Consumer<NavigationProvider>(
          builder: (context, navState, snapshot) {
            return SafeArea(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 16),
                                child: CircleAvatar(
                                  radius: 20,
                                  backgroundColor: Colors.black,
                                ),
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
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 16),
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
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Row(
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
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    right: -MediaQuery.of(context).size.width / 1.6,
                    child: Stack(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 1.4,
                          width: MediaQuery.of(context).size.width,
                          child: Hero(
                            tag: navState.prevTitle,
                            child: IgnorePointer(
                              child: navState.screenWidget(navState.prevTitle)
                            )
                          )
                        ),
                        Positioned.fill(
                          child: Container(
                            color: Theme.of(context).primaryColor.withOpacity(0.6),
                          ),
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    right: -MediaQuery.of(context).size.width / 1.4,
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height / 1.2,
                      width: MediaQuery.of(context).size.width,
                      child: Hero(
                        tag: navState.activeTitle,
                        child: IgnorePointer(
                          ignoring: true,
                          child: navState.screenWidget(navState.activeTitle)
                        ),
                      ),
                    ),
                  )
                ],
              ),
            );
          }
        )
      )
    );
  }
}