import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import 'package:shelters/shelf.dart';

class ProfileSh extends StatefulWidget {

  @override
  _ProfileShState createState() => _ProfileShState();
}

class _ProfileShState extends State<ProfileSh> {
  final PanelController _pc = PanelController();

  @override
  Widget build(BuildContext context) {

    return SlidingUpPanel(
      boxShadow: const <BoxShadow>[
        BoxShadow(blurRadius: 3.0, color: Color.fromRGBO(0, 0, 0, 0.25))
      ],
      backdropEnabled: true,
      parallaxEnabled: true,
      minHeight: 60,
      controller: _pc,
      panel: InkWell(
        child: Container(
          color: Theme.of(context).scaffoldBackgroundColor,
          child: ListTile(
            title: Text("О приложении"),
            trailing: Text('v 0.5'),
          ),
        ),
        onTap: () => _pc.open(),
      ),
      body: _bodyWidget(context)
    );
  }

  Widget _bodyWidget(BuildContext context){
    
    final NavigationBloc _navigationBloc = BlocProvider.of<NavigationBloc>(context);
    final AuthenticationBloc _authenticationBloc =
      BlocProvider.of<AuthenticationBloc>(context);

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
                      URL
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
        // Card(
        //   child: ListTile(
        //     title: Text('О приложении'),
        //     onTap: () {
        //       try{
        //         toast('isPanelShown: ${_pc.isPanelShown().toString()}');
        //       } catch(error){
        //         toast('isPanelShown: ${error.toString()}');
        //       }
        //     }
        //   ),
        // ),
        Card(
          child: ListTile(
            title: Text('Выйти', 
              style: TextStyle(
                color: Colors.red
              )
            ),
            onTap: () {
              _navigationBloc.dispatch(NavigationEvent.one);
              _authenticationBloc.dispatch(LoggedOut());
            },
          ),
        ),
      ],
    );
  }
  void changeBrightness(BuildContext context) {
    DynamicTheme.of(context).setBrightness(
      Theme.of(context).brightness == Brightness.dark
      ? Brightness.light
      : Brightness.dark
    );
  }
  
}
