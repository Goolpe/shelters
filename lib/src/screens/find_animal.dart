import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shelters/shelf.dart';

class FindAnimalScreen extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: <Widget>[
        Divider(height: 1),
        CustomListTile(
          title: Text('name'),
          trailing: TextField(
            textCapitalization: TextCapitalization.sentences,
            decoration: InputDecoration.collapsed(hintText: ''),
            inputFormatters:[
              LengthLimitingTextInputFormatter(20),
            ]
          ),
        ),
        Divider(height: 1),
        CustomListTile(
          title: Text('breed'),
          trailing: TextField(
            textCapitalization: TextCapitalization.sentences,
            decoration: InputDecoration.collapsed(hintText: ''),
            inputFormatters:[
              LengthLimitingTextInputFormatter(20),
            ]
          ),
        ),
        Divider(height: 1),
        CustomListTile(
          title: Text('date of birth'),
          trailing: GestureDetector(
            child: Text('Date'),
            onTap: () => _showDate(context),
          )
        ),
        Divider(height: 1),
      ]
    );
  }
  
  void _showDate(context){
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2018),
      lastDate: DateTime(2030),
      builder: (BuildContext context, Widget child) {
        return Theme(
          data: ThemeData.dark(),
          child: child,
        );
      },
    );
  }
}