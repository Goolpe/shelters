import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:shelters/index.dart';

class MenuScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff416c6d),
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 24),
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
                            radius:20,
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
                            title: 'Adoption',
                          ),
                          MenuItem(
                            icon: MdiIcons.home,
                            title: 'Donation',
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
                            icon: MdiIcons.message,
                            title: 'Messages',
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
              right: -MediaQuery.of(context).size.width / 1.8,
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24)
                    ),
                    height: MediaQuery.of(context).size.height / 1.6,
                    width: MediaQuery.of(context).size.width,
                    child: Hero(
                      tag: 'DontationScreen',
                      child: IgnorePointer(
                        child: HomeScreen()
                      )
                    )
                  ),
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        color: Color(0xff416c6d).withOpacity(0.6),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Positioned(
              right: -MediaQuery.of(context).size.width / 1.5,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                ),
                height: MediaQuery.of(context).size.height / 1.4,
                width: MediaQuery.of(context).size.width,
                child: Hero(
                  tag: 'HomeScreen',
                  child: IgnorePointer(
                    child: HomeScreen()
                  )
                )
              ),
            )
          ],
        ),
      ),
    );
  }
}