import 'package:flutter/material.dart';
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
      'tap': '/shelters'
    },
    {
      'title' : 'О приложении',
      'trailing': '',
      'tap': '/shelters'
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
                      image: NetworkImage(
                        'https://image.freepik.com/free-vector/seamless-dogs-pattern_1284-3639.jpg'
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: ListTile()
                )
              ),
              Positioned(
                top: 50,
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
          Column(
            children: List.generate(settingsList.length, (int i) {
              return Card(
                child: ListTile(
                  title: Text(settingsList[i]['title'], style: TextStyle(
                    color: i == settingsList.length - 1
                    ? Colors.red
                    : Colors.black),
                  ),
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
}
