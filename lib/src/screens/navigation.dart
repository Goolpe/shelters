import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'package:shelters/shelf.dart';

class NavigationSh extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final NavigationBloc navigationBloc = BlocProvider.of<NavigationBloc>(context);

    return BlocBuilder<NavigationEvent, int>(
      bloc: navigationBloc,
      builder: (BuildContext context, int currentPage) {
        return Scaffold(
          body: _showPage(currentPage),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            selectedFontSize: 12,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(MdiIcons.viewDashboard),
                title: Container(height: 0)
              ),
              BottomNavigationBarItem(
                icon: Icon(MdiIcons.magnify),
                title: Container(height: 0)
              ),
              BottomNavigationBarItem(
                icon: Icon(MdiIcons.paw),
                title: Container(height: 0)
              ),
              BottomNavigationBarItem(
                icon: Icon(MdiIcons.libraryBooks),
                title: Container(height: 0)
              ),
              BottomNavigationBarItem(
                icon: Icon(MdiIcons.accountCircle),
                title: Container(height: 0)
              ),
            ],
            currentIndex: currentPage,
            selectedItemColor: _currentColor(currentPage),
            onTap: (int index) => _currentPage(index, navigationBloc),
          ),
        );
      }
    );
  }

  Widget _showPage(int currentPage){
    switch(currentPage){
      case 0: return HomeSh();
      case 1: return SearchListSh();
      case 2: return CenterSh();
      case 3: return ProfileSh();
      case 4: return ProfileSh();
      default: return HomeSh();
    }
  }

  void _currentPage(int index, dynamic _navigationBloc){
    switch(index){
      case 0: return _navigationBloc.dispatch(NavigationEvent.one);
      case 1: return _navigationBloc.dispatch(NavigationEvent.two);
      case 2: return _navigationBloc.dispatch(NavigationEvent.three);
      case 3: return _navigationBloc.dispatch(NavigationEvent.four);
      case 4: return _navigationBloc.dispatch(NavigationEvent.five);
    }
  }

  Color _currentColor(int currentPage){
    switch(currentPage){
      case 0: return Colors.amber[800];
      case 1: return Colors.red;
      case 2: return Colors.green;
      case 3: return Colors.blue;
      case 4: return Colors.indigo;
      default: return Colors.amber[800];
    }
  }
}
