import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:shelters/shelf.dart';

class FindPersonScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FindPersonBloc, FindPersonState>(
      builder: (context, FindPersonState state){
        if(state is FindPersonInitial){
          return _findPersonList(context, state.person);
        }
        return SizedBox();
      },
    );
  }

  _findPersonList(context, PersonModel person){
    return ListView(
      shrinkWrap: true,
      children: <Widget>[
        Divider(height: 1),
        CustomListTile(
          title: Text('firstName'),
          trailing: TextFormField(
            textCapitalization: TextCapitalization.sentences,
            decoration: InputDecoration.collapsed(
              hintText: '',
            ),
            initialValue: person.firstName,
            onChanged: (String value){
              BlocProvider.of<FindPersonBloc>(context).add(FindPersonFirstNameUpdated(firstName: value));
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
            onChanged: (String value) => 
              BlocProvider.of<FindPersonBloc>(context).add(FindPersonLastNameUpdated(lastName: value)),
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
      initialDate: DateTime.now(),
      firstDate: DateTime(1990),
      lastDate: DateTime.now(),
    );

    if(date != null && date != person.dateOfBirth){
      BlocProvider.of<FindPersonBloc>(context).add(FindPersonDateOfBirthUpdated(dateOfBirth: date));
    }
  }

  void _showDateOfLoss(BuildContext context, PersonModel person) async{
    final DateTime date = await showDatePicker(
      context: context,
      initialDate: person.dateOfLoss ?? DateTime.now(),
      firstDate: person.dateOfBirth ?? DateTime(1990),
      lastDate: DateTime.now(),
    );

    if(date != null && date != person.dateOfLoss){
      BlocProvider.of<FindPersonBloc>(context).add(FindPersonDateOfLossUpdated(dateOfLoss: date));
    }
  }

  String _convertDate(DateTime date){
    if(date == null) return 'Choose date';
    else return DateFormat('dd MMMM yyyy').format(date);
  }
}