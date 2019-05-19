import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ProfileSh extends StatelessWidget {
  final List<Map<String, String>> settingsList = [
    {
      'title' : 'Местоположение',
      'trailing': 'Санкт-Петербург',
      'tap': '/shelters'
    },
    {
      'title' : 'Мои питомцы',
      'trailing': '',
      'tap': '/my_pets'
    },
    {
      'title' : 'О приложении',
      'trailing': '',
      'tap': '/about_app'
    },
    {
      'title' : 'Выйти',
      'trailing': '',
      'tap': '/shelters'
    }
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
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
              Positioned(
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
          Column(
            children: List.generate(settingsList.length, (int i) {
              return Card(
                child: ListTile(
                  title: i == settingsList.length - 1
                    ? Text(settingsList[i]['title'], style: TextStyle(
                      color: Colors.red))
                    : Text(settingsList[i]['title']),
                  trailing: Text(settingsList[i]['trailing']),
                  onTap: () => Navigator.pushNamed(context, settingsList[i]['tap']),
                ),
              );
            }),
          ),
        ],
      )
    );
  }

  void changeBrightness(BuildContext context) {
    DynamicTheme.of(context).setBrightness(Theme.of(context).brightness == Brightness.dark? Brightness.light: Brightness.dark);
  }
}
