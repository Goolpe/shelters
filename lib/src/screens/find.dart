import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shelters/shelf.dart';

class FindScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Consumer<FindModel>(
        builder: (context, state, _){
          return ListView(
            children: <Widget>[
              _showChoice(context, state.findType),
              _showScreen(state.findType)
            ]
          );
        },
      )
    );
  }

  Widget _showChoice(context, FindType state){
    return CustomListTile(
      title: Text('I\'ve lost'),
      trailing: DropdownButton<FindType>(
        underline: SizedBox(),
        value: state,
        items: [
          DropdownMenuItem(
            child: Text('Person'),
            value: FindType.person,
          ),
          DropdownMenuItem(
            child: Text('Animal'),
            value: FindType.animal,
          )
        ],
        onChanged: (FindType val){
          Provider.of<FindModel>(context, listen: false).change(val);
        },
      ),
    );
  }

  Widget _showScreen(FindType state){
    if(state == FindType.animal){
      return FindAnimalScreen();
    } else if(state == FindType.person){
      return FindPersonScreen();
    }
    return SizedBox();
  }
}