import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shelters/shelf.dart';

class FindPersonScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Consumer<FindPersonModel>(
        builder: (context, state, _) {
          return _findPersonList(context, state.person);
        }
    );
  }

  _findPersonList(context, PersonModel person){
    return ListView(
      shrinkWrap: true,
      children: <Widget>[
        Container(
          height: 150,
          child: ListView.builder(
            itemCount: person.pictures == null ? 1 : person.pictures.length + 1,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, int i){

              return InkWell(
                child: Container(
                  width: 120,
                  decoration: BoxDecoration(
                    color: Color(0xffdbe2ef),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  margin: EdgeInsets.only(left: 10, right: i == 4 ? 10 : 0, top: 10, bottom: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: person.pictures != null && i < person.pictures.length 
                    ? Image.memory(person.pictures[i], fit: BoxFit.cover)
                    : Icon(MdiIcons.imagePlus, color: Colors.blueGrey,),
                  )
                ),
                onTap: () => Provider.of<FindPersonModel>(context, listen: false).changePictures(),
              );
            },
          )
        ),
        CustomListTile(
          title: Text('firstName'),
          trailing: TextFormField(
            textCapitalization: TextCapitalization.sentences,
            decoration: InputDecoration.collapsed(
              hintText: '',
            ),
            initialValue: person.firstName,
            onChanged: (String value){
              Provider.of<FindPersonModel>(context, listen: false).changeFirstName(value);
            },
            inputFormatters:[
              LengthLimitingTextInputFormatter(20),
            ]
          ),
        ),
        Divider(height: 1),
        CustomListTile(
          title: Text('last name'),
          trailing: TextFormField(
            textCapitalization: TextCapitalization.sentences,
            decoration: InputDecoration.collapsed(hintText: ''),
            initialValue: person.lastName,
            onChanged: (String value){
              Provider.of<FindPersonModel>(context, listen: false).changeLastName(value);
            },
            inputFormatters:[
              LengthLimitingTextInputFormatter(20),
            ]
          ),
        ),
        Divider(height: 1),
        CustomListTile(
          title: Text('date of birth'),
          trailing: GestureDetector(
            child: Text(_convertDate(person.dateOfBirth)),
            onTap: () => _showDateOfBirth(context, person),
          )
        ),
        Divider(height: 1),
        CustomListTile(
          title: Text('date of loss'),
          trailing: GestureDetector(
            child: Text(_convertDate(person.dateOfLoss)),
            onTap: () => _showDateOfLoss(context, person),
          )
        ),
        Divider(height: 1),
      ]
    );
  }

  void _showDateOfBirth(BuildContext context, PersonModel person) async{
    final DateTime date = await showDatePicker(
      context: context,
      initialDate: person.dateOfBirth ?? person.dateOfLoss ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: person.dateOfLoss ?? DateTime.now(),
    );

    if(date != null && date != person.dateOfBirth){
      Provider.of<FindPersonModel>(context, listen: false).changeDateOfBirth(date);
    }
  }

  void _showDateOfLoss(BuildContext context, PersonModel person) async{
    final DateTime date = await showDatePicker(
      context: context,
      initialDate: person.dateOfLoss ?? DateTime.now(),
      firstDate: person.dateOfBirth ?? DateTime(1900),
      lastDate: DateTime.now(),
    );

    if(date != null && date != person.dateOfLoss){
      Provider.of<FindPersonModel>(context, listen: false).changeDateOfLoss(date);
    }
  }

  String _convertDate(DateTime date){
    if(date == null) return 'Choose date';
    else return DateFormat('dd MMMM yyyy').format(date);
  }
}