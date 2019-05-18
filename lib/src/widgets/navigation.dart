import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:shelters/src/widgets/home.dart';
import 'package:shelters/src/widgets/profile.dart';
import 'package:shelters/src/widgets/donor.dart';
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
          body: showPage(currentPage),
          bottomNavigationBar: BottomNavigationBar(
            selectedFontSize: 12,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.pets),
                title: Text(HOME_STR),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                title: Text(DONOR_STR),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.account_circle),
                title: Text(PROFILE_STR),
              ),
            ],
            currentIndex: currentPage,
            selectedItemColor: choiseColor(currentPage),
            onTap: (int index) => choisePage(index, _navigationBloc),
          ),
        );
      }
    );
  }

  Widget showPage(int currentPage){
    switch(currentPage){
      case 0: return HomeSh();
      case 1: return DonorSh();
      case 2: return ProfileSh();
      default: return HomeSh();
    }
  }

  void choisePage(int index, dynamic _navigationBloc){
    switch(index){
      case 0: return _navigationBloc.dispatch(NavigationEvent.first);
      case 1: return _navigationBloc.dispatch(NavigationEvent.second);
      case 2: return _navigationBloc.dispatch(NavigationEvent.third);
    }
  }

  Color choiseColor(int currentPage){
    switch(currentPage){
      case 0: return Colors.amber[800];
      case 1: return Colors.red;
      case 2: return Colors.green;
      default: return Colors.amber[800];
    }
  }
}
