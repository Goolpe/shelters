import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
  
import 'package:shelters/src/localization/ru.dart';
import 'package:shelters/src/blocs/navigation_bloc.dart';

class NavigationSh extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final NavigationBloc _navigationBloc = BlocProvider.of<NavigationBloc>(context);

    return BlocBuilder<NavigationEvent, int>(
      bloc: _navigationBloc,
      builder: (BuildContext context, int currentPage) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Find your animal'),
          ),
          body: Center(
            child: showPage(currentPage),
          ),
          bottomNavigationBar: BottomNavigationBar(
            selectedFontSize: 12,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.pets),
                title: Text(HOME_STR),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.business, color: Colors.transparent,),
                title: Text(''),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.account_circle),
                title: Text(PROFILE_STR),
              ),
            ],
            currentIndex: currentPage,
            selectedItemColor: Colors.amber[800],
            onTap: (int index) => choisePage(index, _navigationBloc),
          ),
        );
      }
    );
  }

  showPage(int currentPage){
    switch(currentPage){
      case 0: return Text('1');
      case 1: return Text('2');
      case 2: return Text('3');
    }
  }

  choisePage(int index, dynamic _navigationBloc){
    switch(index){
      case 0: return _navigationBloc.dispatch(NavigationEvent.first);
      case 1: return null;
      case 2: return _navigationBloc.dispatch(NavigationEvent.third);
    }
  }
}
