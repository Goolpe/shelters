import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'package:shelters/shelf.dart';

class ProfileSh extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final NavigationBloc _navigationBloc = BlocProvider.of<NavigationBloc>(context);

    return Column(
      children: <Widget>[
        Stack(
          children: <Widget>[
            Container(
              height: 150,
              padding: EdgeInsets.only(bottom: 50),
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: CachedNetworkImageProvider(
                      'https://image.freepik.com/free-vector/seamless-dogs-pattern_1284-3639.jpg'
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              )
            ),
            Positioned(
              top: 40,
              right: 20,
              child: CircleAvatar(
                radius: 50,
                backgroundColor: Colors.blue,
                child: Icon(MdiIcons.paw, size: 50, color: Colors.white),
              )
            ),
            const Positioned(
              top: 120,
              left: 15,
              child: Text('HopeHey')
            ),
          ],
        ),
        Card(
          child: ListTile(
            title: Text('Тема'),
            trailing: Text(Theme.of(context).brightness == Brightness.dark ? 'Темная': 'Светлая'),
            onTap: () => changeBrightness(context),
          ),
        ),
        Card(
          child: ListTile(
            title: Text('Язык'),
            trailing: Text('Русский'),
            onTap: (){},
          ),
        ),
        Card(
          child: ListTile(
            title: Text('Местоположение'),
            trailing: Text('Санкт-Петербург'),
            onTap: () => Navigator.pushNamed(context, '/my_location'),
          ),
        ),
        Card(
          child: ListTile(
            title: Text('Мои питомцы'),
            onTap: () => Navigator.pushNamed(context, '/my_pets'),
          ),
        ),
        Card(
          child: ListTile(
            title: Text('О приложении'),
            onTap: () => Navigator.pushNamed(context, '/about_app'),
          ),
        ),
        Card(
          child: ListTile(
            title: Text('Выйти', 
              style: TextStyle(
                color: Colors.red
              )
            ),
            onTap: () {
              _navigationBloc.dispatch(NavigationEvent.one);
              Navigator.pushNamedAndRemoveUntil(context, '/login', (Route<dynamic> route) => false);
            },
          ),
        ),
      ],
    );
  }

  void changeBrightness(BuildContext context) {
    DynamicTheme.of(context).setBrightness(Theme.of(context).brightness == Brightness.dark? Brightness.light: Brightness.dark);
  }
}
