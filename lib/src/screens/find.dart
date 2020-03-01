import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shelters/shelf.dart';

class FindScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: BlocBuilder<FindBloc,FindType>(
        builder: (context, FindType state){
          return ListView(
            children: <Widget>[
              _showChoice(context, state),
              _showScreen(state)
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
            child: Text('Choise'),
            value: FindType.none,
          ),
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
          BlocProvider.of<FindBloc>(context).add(val);
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