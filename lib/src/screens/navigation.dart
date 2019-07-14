import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:overlay_support/overlay_support.dart';

import 'package:shelters/shelf.dart';

class NavigationSh extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final NavigationBloc navigationBloc = BlocProvider.of<NavigationBloc>(context);
    final ExitBloc exitBloc = BlocProvider.of<ExitBloc>(context);


    return BlocBuilder<NavigationEvent, int>(
      bloc: navigationBloc,
      builder: (BuildContext context, int currentPage) {
        return BlocBuilder<ExitEvent, bool>(
          bloc: exitBloc,
          builder: (BuildContext context, bool exit) {

            return WillPopScope(
              onWillPop: () => _onWillPop(currentPage, navigationBloc, exitBloc, exit),
              child: Scaffold(
                body: _showPage(currentPage),
                bottomNavigationBar: BottomNavigationBar(
                  type: BottomNavigationBarType.fixed,
                  selectedFontSize: 12,
                  items: <BottomNavigationBarItem>[
                    BottomNavigationBarItem(
                      icon: Icon(MdiIcons.viewDashboard),
                      title: Container(height: 0)
                    ),
                    // BottomNavigationBarItem(
                    //   icon: Icon(MdiIcons.magnify),
                    //   title: Container(height: 0)
                    // ),
                    // BottomNavigationBarItem(
                    //   icon: Icon(MdiIcons.paw),
                    //   title: Container(height: 0)
                    // ),
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
              )
            );
          }
        );
      }
    );
  }

  Widget _showPage(int currentPage){
    switch(currentPage){
      case 0: return HomeSh();
      case 1: return ArticlesSh();
      case 2: return ProfileSh();
      default: return HomeSh();
    }
  }

  void _currentPage(int index, NavigationBloc _navigationBloc){
    switch(index){
      case 0: return _navigationBloc.dispatch(NavigationEvent.one);
      case 1: return _navigationBloc.dispatch(NavigationEvent.two);
      case 2: return _navigationBloc.dispatch(NavigationEvent.three);
    }
  }

  Color _currentColor(int currentPage){
    switch(currentPage){
      case 0: return Colors.amber[800];
      case 1: return Colors.red;
      case 2: return Colors.green;
      default: return Colors.amber[800];
    }
  }

  Future<void> _onWillPop(
    int currentPage, 
    NavigationBloc _navigationBloc, 
    ExitBloc _exitBloc, 
    bool exit
  ) async{
    if(currentPage != 0){
      _navigationBloc.dispatch(NavigationEvent.one);
    } else{
      if(!exit){
        toast('Нажмите еще раз, чтобы выйти');
        _exitBloc.dispatch(ExitEvent.yes);
        Timer(
          const Duration(seconds: 2), 
          () => _exitBloc.dispatch(ExitEvent.no)
        );
        return Future<bool>.value(false);
      }
      else{
        SystemNavigator.pop();
      }
    }
  }
}
