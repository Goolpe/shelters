import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shelters/shelf.dart';

class CreateScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Consumer<CreateModel>(
        builder: (context, CreateModel state, _) {
          return _createList(context, state);
        }
      )
    );
  }

  _createList(context, CreateModel state){
    return ListView(
      shrinkWrap: true,
      children: <Widget>[
        Container(
          height: 150,
          child: ListView.builder(
            itemCount: state.pictures == null ? 1 : state.pictures.length + 1,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, int i){
              
              return state.pictures != null && i < state.pictures.length 
              ? Stack(
                children: <Widget>[
                  Container(
                    width: 120,
                    height: 150,
                    decoration: BoxDecoration(
                      color: Color(0xffdbe2ef),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    margin: EdgeInsets.only(left: 10, right: i == 4 ? 10 : 0, top: 10, bottom: 10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.memory(state.pictures[i].uint8, fit: BoxFit.cover)
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(16),
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(MdiIcons.closeCircle, color: Colors.red, size: 30,),
                      ),
                      onTap: () => Provider.of<CreateModel>(context, listen: false).removePicture(state.pictures[i]),
                    )
                  )
                ]
              )
              : Container(
                width: 120,
                height: 150,
                decoration: BoxDecoration(
                  color: Color(0xffdbe2ef),
                  borderRadius: BorderRadius.circular(8),
                ),
                margin: EdgeInsets.only(left: 10, right: i == 4 ? 10 : 0, top: 10, bottom: 10),
                child: InkWell(
                  borderRadius: BorderRadius.circular(8),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Icon(MdiIcons.imagePlus, color: Colors.blueGrey,),
                  ),
                  onTap: () => Provider.of<CreateModel>(context, listen: false).changePictures(),
                ),
              );
            },
          )
        ),
        CustomListTile(
          title: Text('name'),
          trailing: TextFormField(
            textCapitalization: TextCapitalization.sentences,
            decoration: InputDecoration.collapsed(
              hintText: '',
            ),
            initialValue: state.name,
            onChanged: (String value){
              Provider.of<CreateModel>(context, listen: false).changeName(value);
            },
            inputFormatters:[
              LengthLimitingTextInputFormatter(20),
            ]
          ),
        ),
        Divider(height: 1),
        CustomListTile(
          title: Text('type'),
          trailing: TextFormField(
            textCapitalization: TextCapitalization.sentences,
            decoration: InputDecoration.collapsed(hintText: ''),
            initialValue: state.type,
            onChanged: (String value){
              Provider.of<CreateModel>(context, listen: false).changeType(value);
            },
            inputFormatters:[
              LengthLimitingTextInputFormatter(20),
            ]
          ),
        ),
        Divider(height: 1),
        CustomListTile(
          title: Text('breed'),
          trailing: TextFormField(
            textCapitalization: TextCapitalization.sentences,
            decoration: InputDecoration.collapsed(hintText: ''),
            initialValue: state.breed,
            onChanged: (String value){
              Provider.of<CreateModel>(context, listen: false).changeBreed(value);
            },
            inputFormatters:[
              LengthLimitingTextInputFormatter(20),
            ]
          ),
        ),
        Divider(height: 1),
        CustomListTile(
          title: Text('age'),
          trailing: TextFormField(
            textCapitalization: TextCapitalization.sentences,
            decoration: InputDecoration.collapsed(hintText: ''),
            initialValue: state.age,
            onChanged: (String value){
              Provider.of<CreateModel>(context, listen: false).changeAge(value);
            },
            inputFormatters:[
              LengthLimitingTextInputFormatter(20),
            ]
          ),
        ),
        // CustomListTile(
        //   title: Text('date of birth'),
        //   trailing: GestureDetector(
        //     child: Text(_convertDate(state.dateOfBirth)),
        //     onTap: () => _showDateOfBirth(context, state),
        //   )
        // ),
        Divider(height: 1),
        Container(
          margin: EdgeInsets.all(16),
          height: 50,
          child: RaisedButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            elevation: 0,
            textColor: Colors.white,
            color: Color(0xffd63447),
            child: Text('Create'),
            onPressed: (){
              Provider.of<CreateModel>(context, listen: false).create();
            },
          )
        )
      ]
    );
  }
  
  void _showDateOfBirth(BuildContext context, CreateModel state) async{
    final DateTime date = await showDatePicker(
      context: context,
      initialDate: state.dateOfBirth  ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if(date != null && date != state.dateOfBirth){
      Provider.of<CreateModel>(context, listen: false).changeDateOfBirth(date);
    }
  }

  String _convertDate(DateTime date){
    if(date == null) return 'Choose date';
    else return DateFormat('dd MMMM yyyy').format(date);
  }
}